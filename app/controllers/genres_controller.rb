class GenresController < ApplicationController
  def show
		@genre = Genre.find(params[:id])
	end

	def new
		@genre = Genre.new
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def create
  @genre = Genre.new(genre_params(:name)) #set Genre name to "not disabled".
  @genre.save
  redirect_to genre_path(@genre)
end

def update
  @genre = Genre.find(params[:id])
  @genre.update(genre_params(:name))
  redirect_to genre_path(@genre)
end

private


# We pass the permitted fields in as *args;
# this keeps `Genrees_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods

def genre_params(*args)
  params.require(:genre).permit(*args)
end
end

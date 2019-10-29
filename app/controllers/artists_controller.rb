class ArtistsController < ApplicationController

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def create
  @artist = Artist.new(artist_params.require(:artist).permit(:name, :bio)) #set artist name to "not disabled".
  @artist.save
  redirect_to artist_path(@artist)
end

def update
  @artist = Artist.find(params[:id])
  @artist.update(artist_params.require(:artist).permit(:name))
  redirect_to artist_path(@artist)
end

private


# We pass the permitted fields in as *args;
# this keeps `Artistes_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods

def artist_params(*args)
  params.require(:artist).permit(*args)
end
end

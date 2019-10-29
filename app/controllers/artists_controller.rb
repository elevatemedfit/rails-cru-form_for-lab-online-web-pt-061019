class ArtistsController < ApplicationController

	def show
		@artist = ArtistClass.find(params[:id])
	end

	def new
		@artist = ArtistClass.new
	end

	def edit
		@artist = ArtistClass.find(params[:id])
	end

	def create
  @artist = ArtistClass.new(artist_params(:name, :bio))
  @artist.save
  redirect_to artist_path(@artist)
end

def update
  @artist = ArtistClass.find(params[:id])
  @artist.update(artist_params(:title, :room_number))
  redirect_to artist_path(@artist)
end

private


# We pass the permitted fields in as *args;
# this keeps `ArtistClasses_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods

def artist_params(*args)
  params.require(:artist_class).permit(*args)
end
end

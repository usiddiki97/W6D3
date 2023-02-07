class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
    end
end

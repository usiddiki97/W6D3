class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
    end

    def show
        user = Artwork.find(params[:id])
        if user
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        user = Artwork.new(artwork_params)
        if user.save!
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = Artwork.find(params[:id])
        if user.update(artwork_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        user = Artwork.find(params[:id])
        if user.destroy
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end

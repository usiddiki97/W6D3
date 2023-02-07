class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(artwork_shares_params)
        if artwork_share.save!
            render json: artwork_share, status: :created
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end

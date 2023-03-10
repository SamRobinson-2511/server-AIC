class ArtLikesController < ApplicationController
    before_action :find_art
    before_action :find_like, only: [:destroy]

    # def create
    #     if already_liked?
    #         {message: ['I can only be liked once, my friend']}
    #     else
    #         @art.likes.create(viewer_id: current_viewer.id)
    #         redirect_to art_path(@art)
    #     end
        
    # end

    def create
        art_like = current_viewer.likes.new(like_params)
        render json: art_like, status: :created
    end

    def find_like
        like = art.likes.find(params[:id])
    end

    def destroy
        if !(already_liked?)
            {messages: ['Cannot unlike something that has never been liked']}
        else
            like.destroy
        end
        redirect_to art_path(art)
    end

    private
    def find_art
        art = Art.find(params[:art_id])
    end

    def already_liked?
        Like.where(viewer_id: current_viewer.id, art_id:
        params[:art_id]).exists?
    end
end

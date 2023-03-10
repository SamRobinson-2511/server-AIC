class GalleriesController < ApplicationController
    skip_before_action :authorized_viewer, only:[:create, :show, :index, :update]
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
        render json: Gallery.all, status: :ok
    end

    def show 
        gallery = Gallery.find(params[:id])
        render json: gallery, status: :ok
    end

    def add_art
        gallery = Gallery.find(params[:id])
        render json: new_art, status: :created

    end

    # def arts
    #     gallery = Gallery.find(params[:id])
    #     arts = gallery.arts
    #     if arts
    #         render json: arts, status: :ok
    #     elsif
    #         arts.length = 0
    #         render json: {message: ['Get Getting']}
    #     end
    # end

    def create
        gallery = Gallery.create!(gallery_params)
        render json: gallery, status: :created
    end

    def update
        gallery = Gallery.find(params[:id])
        gallery.update!(gallery_params)
        render json: gallery, status: :accepted       
    end

    def destroy
        gallery = Gallery.find(params[:id])
        gallery.destroy
        head :no_content
    end

    def search
        parameter = params[:search].downcase
        debugger
        response = Gallery.all.where("lower(name) LIKE :search", search:"%#{parameter}" )
        render json: response, status: :ok
    end

    private 
    def gallery_params
        params.require(:gallery).permit(:title, :description, :viewer_id, :art_id)
    end
    
    def render_unprocessable_entity invalid
        render json: {errors:invalid.record.errors}, 
        status: :unprocessable_entity
    end
end

class GalleriesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def index
        render json: Gallery.all, status: :ok
    end

    def show 
        gallery = Gallery.find(params[:id])
        render json: gallery, status: :ok
    end


    def create
        gallery = Gallery.create!(gallery_params)
        render json: gallery, status: :created
    end

    def edit_gallery
        gallery = Gallery.find(params[:id])
        gallery.update!(gallery_params)
        render json: gallery, status: :accepted       
    end

    def destroy
        gallery = Gallery.find(params[:id])
        gallery.destroy
        head :no_content
    end

    private 
    def gallery_params
        params.require(:gallery).permit(:name, :description)
    end
end

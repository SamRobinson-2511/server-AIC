

class ArtsController < ApplicationController
    


    def index
        fields = "title,artist_display,id,image_id,[gallery_title]=true,artwork_type_title,category_titles,[is_on_view]=true&[is_public_domain]=true"
        art = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}"))
        render json: art['data'], status: :ok
    end

    def images
        image_id = params[:image_id]
        response = JSON.parse(RestClient.get("https://www.artic.edu/iiif/2/#{image_id}/full/843,/0/default.jpg"))
    end

    def show
        fields = "title,artist_display,id,image_id,gallery_title,artwork_type_title,[is_on_view]=true&[is_public_domain]=true"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}}"))
        render json: response['data'], status: :ok
    end

    def is_on_view
        fields = "[is_on_view]=true"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}"))
        if fields == true
        render json: response, status: :ok
        end
    end

    # def on_view
    #     response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{is_on_view}}"))
    #     if is_on_view?
    #         render json: art, status: :ok
    #     else
    #         {messages: ['Art is not on display']}
    #     end
    # end
    
    def search
        search = params[:search]
        debugger
        fields = "title,artist_display,id,image_id,gallery_title,artwork_type_title,[is_on_view]=true&[is_public_domain]=true"
        art = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks/#{fields}/search?q=#{search}"))
        render json: art, status: :ok
    end
end

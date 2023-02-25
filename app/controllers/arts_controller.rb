class ArtsController < ApplicationController
    
    def fetch_arts
        fields = "title,artist_display,id,image_id,is_on_view"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}"))
        render json: response, status: :ok
    end

    def show_arts
        fields = "title,artist_display,id,image_id,is_on_view"
        
    end
    
    def search_arts
        search = params[:search]
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks/fields=title/search?q=#{search}"))
        render json: response, status: :ok
    end
end

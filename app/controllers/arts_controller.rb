class ArtsController < ApplicationController


    def index
        fields = "title,artist_display,id,image_id,gallery_title,artwork_type_title,[is_on_view]=true&[is_public_domain]=true"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}"))
        iiif_url = response['config'][0]
        image = iiif_url
        # response = response['data']
        # image_id = response['image_id']
        # images = JSON.parse(RestClient.get(("https://www.artic.edu/iiif/2/#{image_id}/full/843,/0/default.jpg")))
        render json: response['data'], status: :ok 
    end

    def show
        id = "id"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{id}"))
        render json: response['data'], status: :ok
    end

    def exhibitions 
        fields = "title"
        response = JSON.parse(RestClient).get("https://api.artic.edu/api/v1/exhibitions?fields=#{fields}")
        render json: response['data'], status: :ok
    end

    # def on_view
    #     response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{is_on_view}}"))
    #     if is_on_view?
    #         render json: art, status: :ok
    #     else
    #         {messages: ['Art is not on display']}
    #     end
    # end
    
    def search_arts
        search = params[:search]
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks/fields=title/search?q=#{search}"))
        render json: response, status: :ok
    end
end

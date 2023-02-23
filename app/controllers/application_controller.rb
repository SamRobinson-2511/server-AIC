class ApplicationController < ActionController::API
    
    def current_viewer
        auth_token = request.headers['auth-token']
        if auth_token
            token = JWT.decode( auth_token, ENV['JWT_TOKEN'])[0]
            return Viewer.find_by( id: token['viewer'])
        else
            return nil
            render json: { message: ['No token found']}, status: :unprocessable_entity
        end
    end

    def authorize!
        unless current_viewer 
            render json: { errors: ['You must be logged in to do that']}, status: :unauthorized
        end
    end

    def fetch_arts
        fields = "title,artist_display,id,image_id,is_on_view"
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks?fields=#{fields}"))
        render json: response, status: :ok
    end
    def search_arts
        search = params[:search]
        response = JSON.parse(RestClient.get("https://api.artic.edu/api/v1/artworks/fields=title/search?q=#{search}))
        render json: response, status: :ok
    end
end

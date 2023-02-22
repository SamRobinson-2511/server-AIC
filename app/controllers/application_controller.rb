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
end

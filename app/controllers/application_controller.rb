class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    before_action :authorized_viewer
    

    def current_viewer
        viewer = Viewer.find_by(id:session[:viewer_id])
    end

    def authorized_viewer
        current_viewer = Viewer.find_by(id: session[:viewer_id])
        unless current_viewer 
        render json: {errors: ['Not Authorized']}, status: :unauthorized
        end
    end 

    


    # def current_viewer
    #     auth_token = request.headers['auth-token']
    #     if auth_token
    #         token = JWT.decode( auth_token, ENV['JWT_TOKEN'])[0]
    #         return Viewer.find_by( id: token['viewer'])
    #     else
    #         return nil
    #         render json: { message: ['No token found']}, status: :unprocessable_entity
    #     end
    # end

    # def authorize!
    #     unless current_viewer 
    #         render json: { errors: ['You must be logged in to do that']}, status: :unauthorized
    #     end
    # end

    private 

    def record_not_found record
        render json: { errors: ["Sorry, #{record.model} was not found"]}, 
        status: :not_found
    end
end

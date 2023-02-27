class SessionsController < ApplicationController
    
    def create
        @viewer = Viewer.find_by( email: params[:email])
        if @viewer and @viewer.authenticate( params[:password ])
            logged_viewer = JWT.encode( { viewer: @viewer.id }, ENV['JWT_TOKEN'])
            render json: { vid: logged_viewer }, status: :ok
        else
            render json: {errors: ['Invalid email or password']}, status: :unauthorized
        end
    end

    def register
        @viewer = Viewer.create!(viewer_params)
        render json: viewer 
    end

    def destroy
        reset_session
        render json: {status: 200, logged_out: true}
    end

    private 
    def viewer_params
        params.require(:session).permit(:first_name, :last_name, :email, :password, :zip_code)
    end
end

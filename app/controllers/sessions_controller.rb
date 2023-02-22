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
end

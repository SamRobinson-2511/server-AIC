class SessionsController < ApplicationController
    # skip_before_action :authorized_viewer, only:[:create]
    
    def create
        viewer = Viewer.find_by( email: params[:email])
        if viewer&.authenticate( params[:password ])
            # logged_viewer = JWT.encode( { viewer: @viewer.id }, ENV['JWT_TOKEN'])
            # render json: { vid: logged_viewer }, status: :ok
            session[:viewer_id] = viewer.id
        else
            render json: {errors: ['Invalid email or password']}, status: :unauthorized
        end
    end

    def register
        viewer = Viewer.create!(viewer_params)
        render json: viewer 
    end

    def destroy
        debugger
        session.delete :viewer_id
        head :no_content
    end

    private 
    def viewer_params
        params.require(:session).permit(:first_name, :last_name, :email, :password, :zip_code)
    end
end

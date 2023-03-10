class SessionsController < ApplicationController
    skip_before_action :authorized_viewer, only:[:login, :destroy, :index, :show]
    
    def login
        viewer = Viewer.find_by( email: params[:email])
        if viewer&.authenticate( params[:password])
            # logged_viewer = JWT.encode( { viewer: @viewer.id }, ENV['JWT_TOKEN'])
            # render json: { uid: logged_viewer }, status: :ok
            session[:viewer_id] = viewer.id
            render json: viewer, status: :ok
        else
            render json: {errors: ['Invalid email or password']}, status: :unauthorized
        end
    end

    def logout
        session.delete :viewer_id 
        head :no_content
    end

    def show
        session = Session.find!(params[:id])
        render json: session
    end
    private 
    def viewer_params
        params.require(:session).permit(:first_name, :last_name, :email, :password, :zip_code)
    end
end

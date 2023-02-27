class ViewersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    
    def show
        viewer = Viewer.find(params[:id])
        render json: viewer, status: 200
    end
    
    def create
        viewer = Viewer.create!(viewer_params)
        render json: viewer, status: :created
    end

    def login
        viewer = Viewer.find_by(email:params[:email])
        if viewer && viewer.authenticate(params[:password])
            render json: viewer, status: :ok
        else 
            render json: {errors: 'Incorrect Username or Password'}, status: :unauthorized
        end 
    end 

    def update 
        viewer = Viewer.find(params[:id])
        viewer.update!(viewer_params)
        render json: viewer, status: :accepted
    end

    private
    def viewer_params
        params.permit(:first_name, :last_name, :email, :password, :zip_code)
    end
    
    def render_unprocessable_entity invalid
        render json: {errors:invalid.record.errors}, 
        status: :unprocessable_entity
    end
end


class ViewersController < ApplicationController
rescue_from ActiveRecord::
    
    def create
        viewer = User.create!(viewer_params)
        render json: viewer, status: :created
    end

    def update 
        viewer = = User.find(user_params)
        render json: viewer, status: :updated
    end

    def show
        viewer = User.find(user_params)
        render json: viewer, status: 200
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :zip_code)
    end
    
    def render_unprocessable_entity invalid
        render json: {errors:invalid.record.errors}, 
        status: :unprocessable_entity
    end
end

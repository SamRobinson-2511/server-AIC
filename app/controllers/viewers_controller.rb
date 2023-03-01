class ViewersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    skip_before_action :authorized_viewer, only:[:create, :show, :update]
    
    def show
        viewer = Viewer.find(params[:id])
        render json: viewer, status: 200
    end
    
    def create
        viewer = Viewer.create!(viewer_params)
        session[:viewer_id] = viewer.id
        render json: viewer, status: :created
    end

    def update 
        viewer = Viewer.find(params[:id])
        viewer.update!(viewer_params)
        render json: viewer, status: :accepted
    end

    private
    def viewer_params
        params.permit(:first_name, :last_name, :email, :password, :zip_code, :gallery_id)
    end
    
    # def render_unprocessable_entity invalid
    #     render json: {errors:invalid.record.errors}, 
    #     status: :unprocessable_entity
    # end
end


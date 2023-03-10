class ViewersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    skip_before_action :authorized_viewer, only:[:register, :create, :show, :index, :update]
    
 

    def index
        render json: Viewer.all, status: :ok
    end

    def show
        viewer = Viewer.find(params[:id])
        render json: viewer, status: 200
    end

    
    # def register
    #     viewer = Viewer.create!(viewer_params)
    #     session[:viewer_id] = viewer.id
    #     render json: viewer, status: :created
    # end

    def viewer_profile
        profile = "Welcome back, #{self.first_name}"
        render json: profile, status: :ok
    end

    def update 
        viewer = Viewer.find(params[:id])
        viewer.update!(viewer_params)
        render json: viewer, status: :accepted
    end

    def register
        viewer = Viewer.create!(viewer_params)
        if viewer.valid?
            session[:viewer_id] = viewer.id
            render json: viewer, status: 201
        else
            render json: { error: viewer.error.full_messages }, status: 422
        end
    end

    def destroy
        viewer = Viewer.find(params[:id])
        viewer.destroy
        head :no_content
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


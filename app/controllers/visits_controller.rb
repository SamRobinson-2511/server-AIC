class VisitsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        render json: Visit.all, status: :ok
    end

    def show 
        visit = Visit.find(params[:id])
        render json: visit, status: :ok
    end

    def create
        visit = Visit.create!(visit_params)
        render json: visit, status: 201
    end

    def update
        visit = Visit.find(params[:id])
        visit.update!(visit_params)
        render json: visit, status: :accepted       
    end

    def destroy
        visit = Visit.find(params[:id])
        visit.destroy
        head :no_content
    end

    private
    def visit_params
        params.permit(:viewer_id, :date, :comment)
    end

    def render_unprocessable_entity invalid
        render json: {errors:invalid.record.errors}, 
        status: :unprocessable_entity
    end
end

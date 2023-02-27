class Admin::ViewersController < ApplicationController
    def destroy
        viewer = Viewer.find(params[:id])
        viewer.destroy
        head :no_content
    end
end

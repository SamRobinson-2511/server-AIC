class ViewersController < ApplicationController
    
    before_action :authorize!, only: [:update]

    def update
        render json: {message: ['You hit the update'], viewer: current_viewer}, status: :ok

    end

end

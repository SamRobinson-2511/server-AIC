class SearchController < ApplicationController
    def search 
        @arts = Art.search(params[:query])
    end
end

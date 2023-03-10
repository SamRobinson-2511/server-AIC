class SearchController < ApplicationController
    def search 
        debugger
        arts = Art.search(params[:query])
    end
end

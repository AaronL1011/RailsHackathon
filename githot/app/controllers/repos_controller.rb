class ReposController < ApplicationController

    def index
    end

    def create
    end
    
    def new
    end

    def show
        @repo = Repo.find(params[:id])
        @comments = Comment.all
    end

    def update
    end

    def destroy
    end
end
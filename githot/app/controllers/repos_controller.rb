class ReposController < ApplicationController

    def index
        @repos = Repo.all
    end

    def create
        @repo = Repo.create(repo_params)
    end
    
    def new
        @repo = Repo.new
    end

    def show
        @repo = Repo.find(params[:id])
        @comments = Comment.all
    end

    def update
    end

    def destroy
        @repo = Repo.find_by_id(params[:id])
    end

    def like
        @repo = Repo.find_by_id(params[:id])
        @repo.update(likes: @repo.likes + 1)
    end

    def dislike
        @repo = Repo.find_by_id(params[:id])
        @repo.update(likes: @repo.likes - 1)
    end

    private 
    
    def repo_params
        params.require(:repo).permit(:title, :description, :stars, :language, :url)
    end
end
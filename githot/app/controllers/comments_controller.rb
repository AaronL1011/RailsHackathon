class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end

    def create
        @repo = Repo.find(params[:repo_id])
        @comment = current_user.comments.create(repo_id: @repo[:id], body: comment_params[:body])
        redirect_to repo_path(@repo)
    end

    def update
    end

    def destroy
        @repo_id = params[:repo_id]
        Comment.find(params[:id]).destroy
        redirect_to repo_path(@repo_id)
    end

    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
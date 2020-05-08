class LikesController < ApplicationController
    before_action :find_repo, :find_like

    def create
        if already_liked?
            flash[:notice] = "Unliked!"
            @like.destroy
        else
            @repo.likes.create(user_id: current_user.id)
            flash[:notice] = "Liked!"
        end
        
        redirect_to show_repo_path(@repo)
    end

    private

    def already_liked?
        return Like.where(user_id: current_user.id, repo_id: params[:repo_id]).exists?
    end

    def find_repo
        @repo = Repo.find(params[:repo_id])
    end

    def find_like
        @like = @repo.likes.find_by_user_id(current_user.id)
     end
end

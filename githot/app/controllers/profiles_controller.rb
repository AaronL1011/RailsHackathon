class ProfilesController < ApplicationController
    # show profile
    def index
        @user = User.find(params[:id])
        @comments = Comment.all
    end

    def edit 
<<<<<<< Updated upstream
        
=======
        @user = User.find(params[:id])
    end

    def update
        @user = User.update(params[:id], user_params)

        if @user.errors.any?
            render "edit"
        else 
        end
    end

    private

    def user_params
        params.require(:user).permit(:bio, :picture)
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    end
end
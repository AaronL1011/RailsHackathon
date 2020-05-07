class ProfilesController < ApplicationController
    # show profile
    def index
        @user = User.find(params[:id])
        @comments = Comment.all
    end

    def edit 
        
    end
end
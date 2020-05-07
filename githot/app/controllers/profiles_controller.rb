class ProfilesController < ApplicationController
    # show profile
    def index
        @user = User.find(params[:id])
    end

    def edit 
        
    end
end
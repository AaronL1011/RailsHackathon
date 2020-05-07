class PagesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        # Example line for finding most popular seembly language tetris repos
        # response = HTTParty.get("https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc")

        # Gets all of the most popular repos for the specified YYYY-MM-DD
        response = HTTParty.get("https://api.github.com/search/repositories?q=created:>2020-04-30&sort=stars&order=desc")
        json_resp = JSON.parse(response.body)

        render json: json_resp
        # p json_resp
    end

end


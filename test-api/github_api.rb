# Simple program to test/experiment with the Github API functionality
require 'HTTParty'
require 'json'

# searches all repositories owned by defunkt that contain the word Github and Octocat
# q=GitHub+Octocat+in:readme+user:defunkt

# query string for finding the hottest repositories made in the last week format:
# q=created:>`date -v-7d '+%Y-%m-%d'`
# String for the past week 
# q=created:>2020-05-06&sort=stars&order=desc

# response = HTTParty.get("https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc")
response = HTTParty.get("https://api.github.com/search/repositories?q=created:>2020-04-30&sort=stars&order=desc")
json_resp = JSON.parse(response.body)

# Name of Repo
p json_resp["items"][0]["name"]
# URL link to Repo
p json_resp["items"][0]["html_url"]
# Description 
p json_resp["items"][0]["description"]
# Stars 
p json_resp["items"][0]["stargazers_count"]

# Language
p json_resp["items"][0]["language"]
# Number of Forks
p json_resp["items"][0]["forks_count"]
# Username of Repo Owner
p json_resp["items"][0]["owner"]["login"]
# Link to Repo owner Github Profile
p json_resp["items"][0]["owner"]["html_url"]
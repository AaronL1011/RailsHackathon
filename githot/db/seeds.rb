# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# NOTE: move this to the repos_conroller.rb 
# Get the Repos data for the last 7 days from Github Search API
response = HTTParty.get("https://api.github.com/search/repositories?q=created:>2020-04-30&sort=stars&order=desc")
json_resp = JSON.parse(response.body)

repos_count = 20
for i in 0..repos_count-1
    title = json_resp["items"][i]["name"]
    description = json_resp["items"][i]["description"]
    stars = json_resp["items"][i]["stargazers_count"]
    Repo.create(title: title, description: description, stars: stars)
    puts "#{title} - Repo Created"
end
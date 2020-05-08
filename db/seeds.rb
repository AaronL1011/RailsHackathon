Repo.destroy_all()
Comment.destroy_all()
User.destroy_all()

case Rails.env
when "development"
    user = User.new
    user.email = "admin@admin.com"
    user.name = "admin"
    user.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    user.password = "admin123"
    user.encrypted_password = "$2a$11$CGmdaAQM/m5DA9MwKJN5/eu1f9zzmVS1kb4WgP/6.ZOh.gGswWXIS"
    user.save!
end

response = HTTParty.get("https://api.github.com/search/repositories?q=created:>2020-04-30&sort=stars&order=desc")
json_resp = JSON.parse(response.body)

for i in 0...10
    title = json_resp["items"][i]["name"]
    description = json_resp["items"][i]["description"]
    stars = json_resp["items"][i]["stargazers_count"]
    language = json_resp["items"][i]["language"]
    url = json_resp["items"][i]["html_url"]
    forks = json_resp["items"][i]["forks_count"]
    owner = json_resp["items"][i]["owner"]["login"]
    likes = 0
    dislikes = 0
    Repo.create(title: title, description: description, stars: stars, language: language, url: url, forks: forks, owner: owner)
    puts "#{title} - Repo Created"
end

# needs to be created after usr and repos are populated
case Rails.env
when "development"
    20.times {
        User.first.comments.create(repo_id: 1, body: "lorem something cool something")
    }
end
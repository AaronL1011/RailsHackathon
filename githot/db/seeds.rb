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

20.times {
    User.first.comments.create(repo_id: 1, body: "lorem something cool something")
}
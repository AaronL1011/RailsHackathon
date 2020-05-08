response = HTTParty.get("https://api.github.com/search/repositories?q=created:>2020-04-30&sort=stars&order=desc")
json_resp = JSON.parse(response.body)

namespace :batch do
  desc "Populates the database weekly with new repositories"
  task populate_repos: :environment do
    puts("Populating database...")
    Repo.destroy_all()
    i = 0
    10.times {
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
      i += 1
    }
  end
end

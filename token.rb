# You must generate a personal API token on GitHub in order to user this
# Set an environment variable called GHREPO_KEY to your API key in order to
# use this

`curl -u "samsamskies:#{ENV['GHREPO_KEY']}" https://api.github.com/user/repos -d '{"name":"'testing'"}'`
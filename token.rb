
# Set an environment variable called GHREPO_KEY to your API key in order to
# use this
require 'debugger'
require 'json'
require 'pry'
repo_name = ARGV[0]

response = `curl -u "samsamskies:#{ENV['GHREPO_KEY']}" https://api.github.com/user/repos -d '{"name":"'#{repo_name}'"}'`

git_url = JSON.parse(response)['git_url']

`git clone "#{git_url}"`
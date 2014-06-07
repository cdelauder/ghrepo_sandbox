# encoding: utf-8
# Set an environment variable called GHREPO_KEY to your API key in order to
# use this
require 'debugger'
require 'json'
require 'pry'
require 'io/console'



def prompt_password
  puts "password > "
  password = STDIN.noecho(&:gets).chomp
end

def set_url
  ARGV.include?('-ssl') ? 'ssh_url' : 'git_url'
end

def set_username
  ENV['GHREPO_USERNAME'] || prompt_username
end

def prompt_username
  puts "github username > "
  username = STDIN.gets.chomp
end

def set_password
  ENV['GHREPO_KEY'] || prompt_password
end

def set_credentials
  {url: set_url, username: set_username, password: set_password}
end

if ARGV.any?
  repo_name = ARGV.pop
  credentials = set_credentials

  response = `curl -u "#{credentials[:username]}:#{credentials[:password]}" https://api.github.com/user/repos -d '{"name":"'#{repo_name}'"}'`

  git_url = JSON.parse(response)[credentials[:url]]

  `git clone "#{git_url}"`
else
  puts "RTFM dummy!"
  puts <<-eos
    ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░
    ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░
    ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░
    ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░
    ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░
    ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░
    ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░
    ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░
    ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░
    ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░
    ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░
    ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
    ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░
    ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░
    ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░
    ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░
    ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░
    ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░
    ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░
  eos
  puts "such moron very dumb"
end
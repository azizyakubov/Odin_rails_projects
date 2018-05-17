require 'sinatra'
require 'sinatra/reloader'

secret_num = rand(101)

get '/' do
  "THE SECRET NUMBER IS #{secret_num}"
end

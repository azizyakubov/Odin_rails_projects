require 'sinatra'
require 'sinatra/reloader'

secret_num = rand(101)

get '/' do
  erb :index, :locals => {:number => secret_num}
end

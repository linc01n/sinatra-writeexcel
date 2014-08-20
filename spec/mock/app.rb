require 'sinatra'
require 'sinatra/writeexcel'

get '/' do
  writeexcel :test
end

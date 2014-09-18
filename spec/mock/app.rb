require 'sinatra'
require 'sinatra/writeexcel'

get '/' do
  writeexcel :test
end

get '/test_filename' do
  writeexcel :test, filename: "foobar"
end

require 'spec_helper'

describe 'template header' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should return content type application/vnd.ms-excel" do
    get '/'
    expect(last_response.header["Content-Type"]).to eq('application/vnd.ms-excel')
  end
end

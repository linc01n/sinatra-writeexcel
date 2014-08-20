ENV['RACK_ENV'] = 'test'

require_relative './mock/app'
require 'rspec'
require 'rack/test'

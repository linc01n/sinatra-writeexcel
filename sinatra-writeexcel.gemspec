# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra/writeexcel/version'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-writeexcel"
  spec.version       = Sinatra::Writeexcel::VERSION
  spec.authors       = ["Lincoln Lee"]
  spec.email         = ["git@lincoln.hk"]
  spec.summary       = "Support for XLS based views"
  spec.description   = "A gem to generate xls documents by using templates."
  spec.homepage      = "https://github.com/linc01n/sinatra-writeexcel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra", ">= 1.3"
  spec.add_dependency  "writeexcel", "~> 1.0.3"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"
  spec.add_development_dependency "rubocop"
end

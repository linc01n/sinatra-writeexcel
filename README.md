# sinatra-writeexcel
[![Build Status](https://travis-ci.org/linc01n/sinatra-writeexcel.svg?branch=master)](https://travis-ci.org/linc01n/sinatra-writeexcel)
[![Test Coverage](https://codeclimate.com/github/linc01n/sinatra-writeexcel/badges/coverage.svg)](https://codeclimate.com/github/linc01n/sinatra-writeexcel)
[![Dependency Status](https://gemnasium.com/linc01n/sinatra-writeexcel.svg)](https://gemnasium.com/linc01n/sinatra-writeexcel)


sinatra-writeexcel is a sinatra extension to add support for Excel rendering with [writeexcel](https://github.com/cxn03651/writeexcel) templates.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-writeexcel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-writeexcel

## Example

```ruby
require 'sinatra'
require 'sinatra/writeexcel'

get '/' do
  @text = "Hello World!"
  writeexcel :world
end
```

In `views/world.rxls`
```
worksheet = workbook.add_worksheet('Hello')
worksheet.write "A1", @text
```

##License

See [LICENSE.txt](https://github.com/linc01n/sinatra-writeexcel/blob/master/LICENSE.txt)

## Contributing

1. Fork it ( https://github.com/linc01n/sinatra-writeexcel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

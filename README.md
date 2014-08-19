# Sinatra::Writeexcel

TODO: Write a gem description

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


## Contributing

1. Fork it ( https://github.com/[my-github-username]/sinatra-writeexcel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

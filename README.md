# Slim::Builder

Componentize your slim templates.

Where you have repeatedly defined sections like bootstrap panels etc,
you an define them as a component in Ruby and still use slim. 

I have not yet released it as a gem.  Use a github line in your Gemfile
for now and watch the repo for gem release news.

The intended usage is illustrated in the tests, the scope should be the
slim template that you are building the component from.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slim-builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slim-builder

## Contributing

1. Fork it ( https://github.com/[my-github-username]/slim-builder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

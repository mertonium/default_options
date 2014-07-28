# DefaultOptions

Super simple library provides an easy DSL for setting default options in methods.

## Installation

Add this line to your application's Gemfile:

    gem 'default_options'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install default_options

## Usage

Let's say you have a method that returns the number of views a particular blog post receives. This
method also accepts a hash of options to allow use to limit the number of views returned to a
particular date range:

**This is a Rails example, but the library works in any Ruby project**

```
def blog_views(opts = {})
  default_options = {
    :start_date => self.created_at,
    :end_date => Time.zone.now
  }
  options = opts.reverse_merge(default_options)

  self.views.where(:start_date => options[:start_date], :end_date => options[:end_date]).count
end
```

With DefaultOptions, this same code would look like:

```
def blog_views(opts = {})
  options = defaults_for opts do
    start_date self.created_at
    end_date Time.zone.now
  end

  self.views.where(:start_date => options.start_date, :end_date => options.end_date).count
end
```

To add this functionality to any Ruby class, just include the library.

```
require 'default_options' # If you are using Rails, you don't need this line

class AwesomeSauce
  include DefautOptions

  def rad_thing(opts = {})
	…
  end
end
```


## Contributing

1. Fork it ( https://github.com/mertonium/default_options/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

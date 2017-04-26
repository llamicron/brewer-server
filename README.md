# Brewer::Server

This gem is a web interface for [llamicron/brewer](http://github.com/llamicron/brewer)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brewer-server'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install brewer-server
```

## Usage
Run

```shell
$ brewer-server -p [port]
```

replacing, `[port]` with a port of your choosing. Ports under 1024 will need sudo.

Visit `localhost:[port]`

If you're working on a raspberry pi as is intended, replace localhost with the ip of the pi, eg. `192.168.0.224:8080`

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/llamicron/brewer-server).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Luke Sweeney, 2017

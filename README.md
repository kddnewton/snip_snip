# SnipSnip

[![Build Status](https://github.com/kddnewton/snip_snip/workflows/Main/badge.svg)](https://github.com/kddnewton/snip_snip/actions)
[![Gem Version](https://img.shields.io/gem/v/snip_snip.svg)](https://rubygems.org/gems/snip_snip)

SnipSnip tells you what you selected that you shouldn't have in a Rails controller action.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'snip_snip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snip_snip

## Usage

Open `snip-snip.log`:

    $ tail -f log/snip-snip.log

Hit a controller action and see the output.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kddnewton/snip_snip.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

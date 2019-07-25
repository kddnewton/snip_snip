# SnipSnip

[![Build Status](https://travis-ci.com/kddeisz/snip_snip.svg?branch=master)](https://travis-ci.com/kddeisz/snip_snip)

SnipSnip tells you what you selected that you shouldn't have in a Rails controller action.

## Usage

Add `SnipSnip` to your Gemfile:

    $ gem 'snip_snip', group: %i[test development]

Open `snip-snip.log`:

    $ tail -f log/snip-snip.log

Hit a controller action and see the output.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kddeisz/snip_snip.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

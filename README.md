# SnipSnip

[![Build Status](https://travis-ci.com/kddeisz/snip_snip.svg?branch=master)](https://travis-ci.com/kddeisz/snip_snip)
[![Coverage Status](https://coveralls.io/repos/github/kddeisz/snip_snip/badge.svg?branch=master)](https://coveralls.io/github/kddeisz/snip_snip?branch=master)

SnipSnip tells you what you selected that you shouldn't have in a Rails controller action.

## Usage

Add `SnipSnip` to your Gemfile:

    $ gem 'snip_snip', group: %i[test development]

Open `snip-snip.log`:

    $ tail -f log/snip-snip.log

Hit a controller action and see the output.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

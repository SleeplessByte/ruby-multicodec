# Multicodecs

[![Build Status](https://travis-ci.com/SleeplessByte/ruby-multicodec.svg?branch=master)][shield-link-travis]
[![Gem Version](https://badge.fury.io/rb/multicodecs.svg)][shield-link-gem]
[![MIT license](https://img.shields.io/badge/license-MIT-brightgreen.svg)][shield-link-license]
[![Maintainability](https://api.codeclimate.com/v1/badges/e5b0e892f0c098edd78c/maintainability)][shield-link-codeclimate]

[shield-link-travis]: https://travis-ci.com/SleeplessByte/ruby-multicodec
[shield-link-gem]: https://badge.fury.io/rb/multicodecs
[shield-link-license]: http://opensource.org/licenses/MIT
[shield-link-codeclimate]: https://codeclimate.com/github/SleeplessByte/ruby-multicodec/maintainability

> Canonical table of of codecs used by various multiformats

`Multicodecs` is the ruby implementation of [multiformats/multicodec][spec].

## Installation

Add this line to your application's Gemfile:

```Ruby
gem 'multicodecs', require: false
```

Or if you want to autoload the last known table:

```Ruby
gem 'multicodecs'
```

Or if you want the PORO _without_ any values:

```Ruby
gem 'multicodecs', require: 'multicodecs/bare'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multicodecs

## Usage

This is just a codec, not a protocol. This means that this gem only provides
a nice-to-use mapping from the [single source of truth][table] to a PORO. It
also allows you to bring your own values.

```ruby
require 'multicodecs'

Multicodecs['identity']
# => #<struct Multicodecs::Registration code=0, name="identity", tag="multihash">

Multicodecs[0x12]
# => #<struct Multicodecs::Registration code=18, name="sha2-256", tag="multihash">

Multicodecs.find_by(name: 'protobuf')
# => #<struct Multicodecs::Registration code=80, name="protobuf", tag="serialization">
```

You can `register` your own values

```ruby
Multicodecs.register(code: 0x12345, name: 'xxx', tag: 'vendor')
# => #<struct Multicodecs::Registration code=74565, name="xxx", tag="vendor">
```

Convenience methods exist:

- `Multicodecs.names`: returns all the known names
- `Multicodecs.codes`: returns all the known codes
- `Multicodecs.find_by(code: nil, name: nil)`: same as `[]`
- `Multicodecs.fetch_by!(code: nil, name: nil)`: same as `[]` but errors if not found
- `Multicodecs.load_csv(csv, radix: 16)`: loads table.csv like data

## Related

- [`multiformats/multicodec`][git-multicodec]: the spec repository
- [`multiformats/ruby-multibase`][git-ruby-multibase]: the ruby implementation of [`multiformats/multibase`][git-multibase]
- [`multiformats/ruby-multihash`][git-ruby-multihash]: the ruby implementation of [`multiformats/multihash`][git-multihash]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org][web-rubygems].

### Updating the table

The `Rakefile` provides an easy way of updating the `table.csv`, using a `rake`
command.

```ruby
rake update
# => updated lib/table.csv
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [SleeplessByte/ruby-multicodec][git-self].
This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor Covenant][web-coc] code
of conduct.

## License

The gem is available as open source under the terms of the [MIT License][web-mit].

## Code of Conduct

Everyone interacting in the Shrine::ConfigurableStorage project’s codebases,
issue trackers, chat rooms and mailing lists is expected to follow the
[code of conduct][git-self-coc].

[spec]: https://github.com/multiformats/multicodec
[git-self-coc]: https://github.com/SleeplessByte/ruby-multibase/blob/master/CODE_OF_CONDUCT.md
[git-self]: https://github.com/SleeplessByte/ruby-multibase
[git-ruby-multicodec]: https://github.com/SleeplessByte/ruby-multicodec
[git-multicodec-table]: https://github.com/multiformats/multicodec/blob/master/multicodec.csv
[git-multicodec]:  https://github.com/multiformats/multicodec
[git-ruby-multibase]: https://github.com/SleeplessByte/ruby-multibase
[git-multibase]:  https://github.com/multiformats/multibase
[git-ruby-multihash]: https://github.com/multiformats/ruby-multihash
[git-multihash]: https://github.com/multiformats/multihash
[web-coc]: http://contributor-covenant.org
[web-mit]: https://opensource.org/licenses/MIT
[web-rubygems]: https://rubygems.org



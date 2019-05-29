# MongoClarify

WARNING: This program is under construction.

MongoDB explain is a little hard to read because it is JSON.

This program makes it possible to convert MongoDB explain into Markdown table format. As below.

| Key | Value |
| --- | --- |
| Means of Operation  | Collection Scan |
| nReturned           | 1 |
| executionTimeMillis | 59 msec |
| totalKeysExamined   | 0 |
| totalDocsExamined   | 100000 |

## Installation

```ruby
gem 'mongo_clarify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo_clarify

## Usage

In the case of CLI.

```sh
$ mongo_clarify <Json file of MongoDB explain>
```

If you are using Mongoid.

```ruby
MongoClarify.run(Model.where(query).explain)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mongo_clarify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MongoClarify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mongo_clarify/blob/master/CODE_OF_CONDUCT.md).

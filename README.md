# Ridgepoler::Rails

Provides integration between ridgepole and rails 5 newer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ridgepoler-rails'
```

And then execute:

```bash
$ bundle install
$ bundle exec rails generate ridgepole:install
```

## Generators

Once installed, Ridgepoler will generate migration files instead of ActiveRecord migration files when commands like `rails generate model` be used.

## Rake tasks

Ridgepoler will replace or clear some db tasks. If you doesn't need that overrides, you can set `config.ridgepoler.override_db_tasks = false`.

### Clear tasks

- `db:migrate:status`
- `db:rollback`
- `db:schema:cache:clear`
- `db:schema:cache:dump`
- `db:schema:dump`
- `db:schema:load`
- `db:structure:dump`
- `db:structure:load`
- `db:version`

### Override tasks

- `db:migrate` => `ridgepole:apply`
- `db:setup` => `ridgepole:setup`

## Contributing

1. Fork it ( https://github.com/space-pirates-llc/ridgepoler-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

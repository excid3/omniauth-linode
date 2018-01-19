# OmniAuth Linode Strategy

Linode API v4 OmniAuth strategy using OAuth2

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-linode'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-linode

## Usage

`OmniAuth::Strategies::Linode` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linode, ENV['LINODE_CLIENT_ID'], ENV['LINODE_CLIENT_SECRET'], scope: "account:view,linodes:destroy"
end
```

You can create your own API client and get your CLIENT_ID and
CLIENT_SECRET in Linode's new manager: https://cloud.linode.com/profile/clients

Scopes are defined by a comma separated list of
`resource_name:access_level`. You can find the list of resources and
access levels at https://developers.linode.com/v4/access

By default, we ask for `account:view` permission.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/excid3/omniauth-linode. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Linode project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/excid3/omniauth-linode/blob/master/CODE_OF_CONDUCT.md).
# omniauth-linode

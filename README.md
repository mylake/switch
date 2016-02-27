## Switch your feature

# Install

```ruby
#Gemfile
gem 'switch'
# Generate the model and migration
rails g switch:install
# Run the migration
rake db:migrate
# Include the Feature model, e.g. config/initializers/feature.rb:
require 'feature'
```

## Declaring Features

```ruby
features:
  ilake_1: {desc: 'desc1', open: true}
  ilake_2: {desc: 'desc2', open: false}
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

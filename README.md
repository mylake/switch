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
  feature_1: {desc: 'desc1', open: true}
  feature_2: {desc: 'desc2', open: false}
```
## Checking Features

Switch.on? is used to check feature state:

```ruby
Flip.on? :feature_1   # true
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

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

Switch::Setting.set_source("#{Rails.root}/config/custom_path.yml")
# if not set, default path => "#{Rails.root}/config/feature.yml"
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
Switch.on? :feature_1   # true
```

You can switch your feature on:

```ruby
url+'/switch/features'
ex: http://localhost:3000/switch/features
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

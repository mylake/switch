require "switch/engine"

%w{
  concern
  inflector
  core_ext/hash/reverse_merge
  core_ext/object/blank
}.each { |name| require "active_support/#{name}" }


%w{
  abstract_strategy
  database_strategy
  facade
  feature_set
}.each { |name| require "switch/#{name}" }

require "switch/engine" if defined?(Rails)

module Switch
  extend Facade
end

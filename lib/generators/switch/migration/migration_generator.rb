require 'rails/generators/migration'

class Switch::MigrationGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def create_migration_file
    migration_template 'create_features.rb', 'db/migrate/create_features.rb'
  end

  def self.next_migration_number(dirname)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end
end

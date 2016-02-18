$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "switch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "switch"
  s.version     = Switch::VERSION
  s.authors     = ["Lake Chang"]
  s.email       = ["lake.chang@vpon.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Switch."
  s.description = "TODO: Description of Switch."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
end

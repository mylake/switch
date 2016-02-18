module Switch
  class Engine < ::Rails::Engine
    isolate_namespace Switch
    config.autoload_paths << File.expand_path("../../lib", __FILE__)
  end
end

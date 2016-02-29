module Switch

  # Setting for custom set the filepath of config
  # Switch will auto catch the settings, default path is "#{Rails.root}/config/feature.yml"
  class Setting
    @@namespace = nil
    @@switch_setting_path = nil

    def self.set_namespace(value)
      @@namespace = value
    end

    def self.namespace
      @@namespace
    end

    def self.set_source(source)
      @@switch_setting_path = source if source.is_a?(String)
    end

    def self.path
      @@switch_setting_path ||= "#{Rails.root}/config/feature.yml"
    end
  end

  # YamlRepository for active and inactive features
  # The yaml config file should look like this:
  #
  #   features:
  #       an_active_feature: {desc: 'desc1', open: true}
  #       an_inactive_feature: {desc: 'desc2', open: false}
  # Example usage:
  #   repository = YamlRepository.new('/path/to/yaml/file')
  class YamlRepository
    require 'erb'
    require 'yaml'

    # Constructor
    # @param [String] yaml_file_name => the yaml config filename 

    def initialize(yaml_file_name)
      @yaml_file_name = yaml_file_name
    end

    def get_features_setting
      data = read_file(@yaml_file_name)
      get_features(data)
    end

    def read_file(file_name)
      raw_data = File.read(file_name)
      evaluated_data = ERB.new(raw_data).result
      YAML.load(evaluated_data)
    end

    # Extract features from given hash
    def get_features(data)
      namespace = Setting.namespace
      config = namespace ? data[namespace] : data
      # if config.keys
      return [] unless config && (config['features'])
      config['features']
    end

  end
end

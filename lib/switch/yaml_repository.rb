module Switch
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
      return [] unless data && data['features']
      data['features']
    end

  end
end

module Switch
  class FeatureSet
    def self.instance
      @instance ||= self.new
    end

    def self.reset
      @instance = nil
    end

    def initialize
      @definitions =  Switch::YamlRepository.new("#{Rails.root}/config/feature.yml").get_features_setting

      @definitions.each do |k, v|
        @definitions[k] = v.merge({name: k}.stringify_keys)
      end
      @strategies = {database: DatabaseStrategy.new}.stringify_keys
    end

    def on? definition
      @strategies.each_value do |st|
        return st.on?(definition) if st.knows?(definition)
      end
      default_for definition
    end

    def default_for definition
      @definitions[definition['name'].to_s]
    end

    def strategy(klass)
      @strategies[klass]
    end

    def definitions
      return [] if @definitions.empty?
      @definitions.values
    end

    def strategies
      @strategies.values
    end

  end
end

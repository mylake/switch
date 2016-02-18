module Switch
  class FeatureSet
    def self.instance
      @instance ||= self.new
    end

    def self.reset
      @instance = nil
    end

    def initialize
      # @definitions =  Settings['features']
      @definitions =  {"ilake_1"=>{"desc"=>"desc1", "open"=>true}, "ilake_2"=>{"desc"=>"desc2", "open"=>false}}

      @definitions.each do |k, v|
        @definitions[k] = v.merge({name: k}.stringify_keys)
      end
      @strategies = {database: DatabaseStrategy.new}.stringify_keys
    end

    def on? definition
      @strategies.each_value do |st|
        return st.on?(definition) if st.knows?(definition)
      end
      definition['open']
    end

    def default_for definition
      definition['open']
    end

    def strategy(klass)
      @strategies[klass]
    end

    def definitions
      @definitions.values
    end

    def strategies
      @strategies.values
    end

  end
end

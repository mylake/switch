module Switch
  module Facade

    def on?(name)
      feature = {name: name}.stringify_keys
      FeatureSet.instance.on? feature
    end

    def reset
      FeatureSet.reset
    end
  end
end

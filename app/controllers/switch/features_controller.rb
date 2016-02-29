require_dependency "switch/application_controller"

module Switch
  class FeaturesController < ApplicationController

    def index
      @p = FeaturesPresenter.new(Switch::FeatureSet.instance)
    end

    class FeaturesPresenter
      def initialize(feature_set)
        @feature_set = feature_set
      end

      def definitions
        @feature_set.definitions
      end

      def strategies
        @feature_set.strategies
      end

      def status(feature)
        @feature_set.on?(feature) ? 'on' : 'off'
      end

      def default_status(feature)
        @feature_set.default_for(feature) ? 'on' : 'off'
      end

      def strategy_status(strategy, definition)
        if strategy.knows? definition
          strategy.on?(definition) ? 'on' : 'off'
        end
      end

      def switch_url(strategy, definition)
        "/switch/features/#{definition['name']}/strategies/#{strategy.name.underscore}"
      end
    end

  end
end

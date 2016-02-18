module Switch
  class Feature < ActiveRecord::Base
    attr_accessor :default, :desc
  end
end

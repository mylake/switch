class Switch::ModelGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_feature_model_file
    copy_file 'feature.rb', 'app/model/feature.rb'
  end
end

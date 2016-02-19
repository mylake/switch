class Switch::InstallGenerator < Rails::Generators::Base

  def invoke_generators
    %w{ model migration routes}.each do |name|
      generate "switch:#{name}"
    end
  end

end

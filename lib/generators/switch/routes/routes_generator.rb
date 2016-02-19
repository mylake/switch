class Switch::RoutesGenerator < Rails::Generators::Base

  def add_route
    route %{mount Switch::Engine => "/switch"}
  end
end

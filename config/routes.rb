Switch::Engine.routes.draw do
  resources :features, only: [ :index ] do
    resources :strategies,
      only: [ :update, :destroy ]
  end
end

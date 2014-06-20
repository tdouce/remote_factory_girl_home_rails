RemoteFactoryGirlHomeRails::Engine.routes.draw do
  resources :home, only: [:create, :index]
end

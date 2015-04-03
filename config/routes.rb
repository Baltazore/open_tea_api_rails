Rails.application.routes.draw do
  namespace :api do
    resources :teas
  end
end

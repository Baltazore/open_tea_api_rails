Rails.application.routes.draw do
  namespace :api do
    resources :teas, except: [:new, :edit]
  end
end

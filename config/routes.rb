Rails.application.routes.draw do
  resources :stocks, except: :show
  post 'bearer', to: 'bearers#create_or_update', as: :create_or_update
end

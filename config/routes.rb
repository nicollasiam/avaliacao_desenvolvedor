Rails.application.routes.draw do
  root to: 'orders#index'
  post 'orders/upload'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

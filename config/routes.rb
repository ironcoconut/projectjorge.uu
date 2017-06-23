Rails.application.routes.draw do
  devise_for :users
  resources :garden_reports
  resources :gardens
  root 'root#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users

  resources :gardens, path: "uu-gardening-team" do
    resources :garden_reports, path: "reports", as: "reports"
  end

  root 'root#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

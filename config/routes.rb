Rails.application.routes.draw do
  devise_for :users

  resources :gardens, path: "uu-gardening-team" do
    resources :garden_reports, path: "reports"
  end

  root 'root#index'
end

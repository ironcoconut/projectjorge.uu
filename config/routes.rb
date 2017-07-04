Rails.application.routes.draw do
  devise_for :users

  # These get a really path helper name if declared as part of the garden resource above
  # Also have to be declared first or the route will point to gardens#show
  get  "uu-gardening-team/new_report", :to => "garden_reports#new", as: "new_garden_report"
  post "uu-gardening-team/new_report", :to => "garden_reports#create", as: "post_garden_report"

  resources :gardens, path: "uu-gardening-team" do
    resources :garden_reports, path: "reports", except: [:new, :create]
  end

  root 'root#index'
end
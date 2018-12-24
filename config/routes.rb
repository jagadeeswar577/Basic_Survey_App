Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'surveys#index'
  resources :surveys
  get "surveys/:id/take_survey", to: "surveys#take_survey"
  post "surveys/submit_survey", to: "surveys#submit_survey"
end

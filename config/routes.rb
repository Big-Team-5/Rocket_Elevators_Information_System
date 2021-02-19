Rails.application.routes.draw do
  #get 'page/index'
  root 'page#index'
  get  'page/residential'
  get  'page/commercial'
  get  'page/quote'
  get  'quote_forms/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :user
  resources :quote_forms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

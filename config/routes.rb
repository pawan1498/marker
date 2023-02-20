Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations', 
        confirmations: 'users/confirmations'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "users/sessions#new"

  devise_scope :user do
    get "/" => "users/sessions#new"
  end
  
  get '/links', to: "link#index"
  get '/new', to: "link#new"
  post '/links',to:"link#create"
  get '/link/:id' ,to: "link#show"
  get '/search', to:"link#search"
  get 'result',to:"link#result"
  get '/autocomplete', to:"link#autocomplete"

  namespace :admin do
    resources :dashboard
  end
  
end

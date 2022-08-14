Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "link#index"
  get '/new', to: "link#new"
  post '/links',to:"link#create"
  get '/show' ,to: "link#show"
  get '/search', to:"link#search"
  get 'result',to:"link#result"
end

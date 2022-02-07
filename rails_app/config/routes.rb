Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/hello',to: 'user#hello'
  post '/user/', to: 'user#create'
  get '/user', to: 'user#show'
  get '/user/:id', to: 'user#show_by_id'
  put '/user', to: 'user#update'
  delete '/user', to: 'user#delete'
end

Rails.application.routes.draw do
  resources :infos
  resources :articles
  resources :blogs, only: %i[index show]
  post 'login', to: 'access_token#create'
  delete 'logout', to: 'access_token#destroy'
  # get '/blogs', to: 'blogs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

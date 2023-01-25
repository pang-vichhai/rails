Rails.application.routes.draw do
  resources :infos
  resources :articles
  resources :blogs, only: %i[index show]
  # get '/blogs', to: 'blogs#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

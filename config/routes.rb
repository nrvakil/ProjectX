Rails.application.routes.draw do

  root 'home#index'

  get '/login' => 'users#authenticate_user'
  post '/set_location' => 'users_location#set_my_location'
  get  '/get_nearby_people' => 'users_location#get_nearby_people'
  post '/hookup' => 'hook_up#hookup'
  post '/respond' => 'hook_up#respond'

  resources :users
end

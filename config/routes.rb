Rails.application.routes.draw do
  devise_for :users

  # Image upload to users show page
  resources :users do
  	member do
  		put 'updatejson'
  	end
  end	
  
  # Image upload to hike show page
  resources :hikes do
    member do
      put 'updatejson2'
    end
  end 
  
  root to: 'hikes#index'
  get 'secure' => 'users#secure'
  post '/hikes/search' => 'hikes#search'
  


end

#               	Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                    users GET    /users(.:format)               users#index
#                          POST   /users(.:format)               users#create
#                 new_user GET    /users/new(.:format)           users#new
#                edit_user GET    /users/:id/edit(.:format)      users#edit
#                     user GET    /users/:id(.:format)           users#show
#                          PATCH  /users/:id(.:format)           users#update
#                          PUT    /users/:id(.:format)           users#update
#                          DELETE /users/:id(.:format)           users#destroy
#                    hikes GET    /hikes(.:format)               hikes#index
#                          POST   /hikes(.:format)               hikes#create
#                 new_hike GET    /hikes/new(.:format)           hikes#new
#                edit_hike GET    /hikes/:id/edit(.:format)      hikes#edit
#                     hike GET    /hikes/:id(.:format)           hikes#show
#                          PATCH  /hikes/:id(.:format)           hikes#update
#                          PUT    /hikes/:id(.:format)           hikes#update
#                          DELETE /hikes/:id(.:format)           hikes#destroy
#                     root GET    /                              users#index
#                   secure GET    /secure(.:format)              users#secure
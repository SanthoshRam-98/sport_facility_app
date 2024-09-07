Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  root 'facilities#index'
  resources :facilities, only: [:index, :show]
  resources :bookings, only: [:create]
end

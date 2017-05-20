Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resources :activities
  resources :sales do
    put 'approve' => 'sales#approve', on: :member, as: :approve
    put 'disapprove' => 'sales#disapprove', on: :member, as: :disapprove
  end
  resources :products
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

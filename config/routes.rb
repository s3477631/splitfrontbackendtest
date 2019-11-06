Rails.application.routes.draw do
  resources :webcodes
  resources :users
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
    devise_scope :user do
      authenticated :user do
      root 'landing#index', as: 'authenticated_root'
      end
      unauthenticated do 
 
        root 'devise/sessions#new', as: 'unauthenticated_root'
      end
     end


end

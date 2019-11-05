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
        get '/signpeopleup', to: 'devise/registrations#new', as: 'signup_please_guys'
      end
     end
      #  get '/dragdrop', to: 'landing#index'
    # devise_scope :user do 
    #   get 'signup', to: 'devise/registrations#new'
    # end
  
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

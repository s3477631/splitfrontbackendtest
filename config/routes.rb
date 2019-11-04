Rails.application.routes.draw do
  resources :webcodes
  resources :users
    # devise_scope :user do
    #   get 'login', to: 'devise/sessions#new'
    #   # root to: 'devise/sessions#new'
    # end
    # devise_scope :user do 
    #   get 'signup', to: 'devise/registrations#new'
    # end
   root to: 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

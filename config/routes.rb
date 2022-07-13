Rails.application.routes.draw do
  resources :trackers
  resources :challenges do
    member do
      patch :move
    end
  end
  resources :not_to_dos do
    member do
      patch :move
    end
  end
  #get 'pages/home'
  devise_for :users
  root "pages#home"
  get "habits", to: "pages#habits"
  get "essentials", to: "pages#essentials"
  get "comfort_zone", to: "pages#comfort_zone"
  get "guide", to: "pages#guide"
  #Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #Defines the root path route ("/")
  #root "articles#index"
end
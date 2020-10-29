Rails.application.routes.draw do
  resources :sushis do 
    resources :ingredients
  end

  resources :ingredients

  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  delete 'logout', to: 'sessions#destroy'


  get '/', to: "sushis#home"
  get '/:anything', to: "application#wrong_page"
end

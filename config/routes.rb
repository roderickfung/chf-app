Rails.application.routes.draw do
  get 'authentication/new'

  root 'index#index'
  get '/about' => 'index#about'
  get '/contact' => 'contact#new'

  get '/search' => 'search#index', as: :search_index
  resource :search, only:[:show]

  resources :clinicians
  resources :patients, only: [:index, :show]
  
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

end

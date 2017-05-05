Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  resource :sessions, only: [:create, :destroy]
  resources :servers, only: [:index, :new, :create, :edit, :update]
end

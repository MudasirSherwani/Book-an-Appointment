Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "doctors#index"
  resources :doctors, only: %i[index create destroy show]
   resources :users do
    resources :appointments, only: %i[index create destroy show]
   end
end

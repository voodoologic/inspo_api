Rails.application.routes.draw do
  resources :districts
  resources :roles
  resources :states
  scope '/api/v1' do
    resources :people
    resources :states
    resources :roles
    resources :districts
    resources :votes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: "furimas#index"
  resources :furimas do
    resources :records, only: [:index, :new, :create]
  end
end

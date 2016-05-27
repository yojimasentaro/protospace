Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources  :users, only: [:show, :edit, :update] do
    resources :prototypes do
      resources :prototype_images
    end
  end
end

Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create]
    resources :taggings, only: [:new, :create]
  end

  resources :authors
end

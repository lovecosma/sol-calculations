Rails.application.routes.draw do
  scope :api do
    resources :numbers
    resources :charts
    resources :owners
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  post 'users', to: 'users#create'
  post 'recipes', to: 'recipes#create'
  get 'recipes', to: 'recipes#index'
  get 'recipes/:recipeUuid', to: 'recipes#show'
  put 'recipes/:recipeUuid', to: 'recipes#update'
  delete 'recipes/:recipeUuid', to: 'recipes#destroy'
  post 'ratings', to: 'ratings#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

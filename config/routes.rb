Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "user_layer#home"
  post "/addUser", to:"user_layer#addUser"
  post "/addGroup", to:"group_layer#addNewGroup"
  post "/addTransaction", to:"transaction_layer#addTransaction"
end

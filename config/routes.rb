Rails.application.routes.draw do
  # Farmer signup & autologin routes
  # post "/farmer_signup", to: "farmers#create"
  # get "/farmer", to: "farmers#show"
  post "/signup", to: "farmers#create"
  get "/me", to: "farmers#show"

  # Farmer login & logout routes
  # post "/farmer_login", to: "farmer_sessions#create"
  # delete "/farmer_logout", to: "farmer_sessions#destroy"
  post "/login", to: "farmer_sessions#create"
  # match "/login", to: "farmer_sessions#create", via: [:options, :post]

  delete "/logout", to: "farmer_sessions#destroy"

  #  # Consumer signup & autologin routes
  #  post "/consumer_signup", to: "consumers#create"
  #  get "/consumer", to: "consumers#show"

  #  # Consumer login & logout routes
  # post "/consumer_login", to: "consumer_sessions#create"
  # delete "/consumer_logout", to: "consumer_sessions#destroy"


  # PRODUCE CRUD OPERATIONS
  # Farmer creates a product
  post "/produce", to: "produces#create"
  # Farmer/Consumer views all available products
  get "/produce", to: "produces#index"
  # Farmer/Consumer one product
  get "/produce/:id", to: "produces#show"
  # Farmer updates a product
  patch "/produce/:id", to: "produces#update"
  # Farmer destroys a product 
  delete "/produce/:id", to: "produces#destroy"

  # GET FARMERS
  get "/farmers", to: "farmer_extras#index"
  # GET FARMER 
  get "/farmers/:id", to: "farmer_extras#show"

end

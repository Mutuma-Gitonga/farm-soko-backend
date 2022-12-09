Rails.application.routes.draw do
  # Farmer signup & autologin routes
  post "/farmer_signup", to: "farmers#create"
  get "/farmer", to: "farmers#show"

  # Farmer login & logout routes
  post "/farmer_login", to: "farmer_sessions#create"
  delete "/farmer_logout", to: "farmer_sessions#destroy"

   # Consumer signup & autologin routes
   post "/consumer_signup", to: "consumers#create"
   get "/consumer", to: "consumers#show"
end

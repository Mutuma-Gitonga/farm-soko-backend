Rails.application.routes.draw do
  post "/farmer_signup", to: "farmers#create"
  get "/farmer", to: "farmers#show"
end

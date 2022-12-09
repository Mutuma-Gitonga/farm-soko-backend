class FarmerSessionsController < ApplicationController
  def create
    farmer = Farmer.find_by(username: params[:username])
    
    if farmer&.authenticate(params[:password])
      session[:farmer_id] = farmer.id
      render json: farmer, status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy 
    session.delete :farmer_id
    head :no_content
  end
end
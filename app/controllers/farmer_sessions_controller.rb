# require 'pry'
class FarmerSessionsController < ApplicationController
  def create
    farmer = Farmer.find_by(username: params[:username])
    # binding.pry
    
    if farmer&.authenticate(params[:password])
      session[:farmer_id] = farmer.id
      render json: farmer, status: :created
    else
      render json: { errors: ["Invalid username or password"]}, status: :unauthorized
    end
  end

  def destroy 
    session.delete :farmer_id
    head :no_content
  end
end

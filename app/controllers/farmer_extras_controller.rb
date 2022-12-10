class FarmerExtrasController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response 

   # GET /farmers
  def index 
    farmers = Farmer.all 
    render json: farmers, only: [:id, :name, :town, :phone, :username], include: {produces: {only: [:id, :name, :quantity, :units, :unit_price]}}, status: :ok
  end
  
  # GET /farmers/:id
  def show 
    farmer = Farmer.find(params[:id])
    render json: farmer, only: [:id, :name, :town, :phone, :username], include: {produces: {only: [:id, :name, :quantity, :units, :unit_price]}}, status: :ok
  end


  private
  def render_record_not_found_response
    render json: {error: "Produce not found"}, status: :not_found
  end
end

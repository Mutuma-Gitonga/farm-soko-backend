class FarmersController < ApplicationController
  wrap_parameters format: []
  before_action :authorize
  skip_before_action :authorize, only: [:create]

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_json_response

  def create 
    farmer = Farmer.create!(farmer_params)

    session[:farmer_id] = farmer.id 
    render json: farmer, status: :created 
  end

  def show 
    farmer = Farmer.find(session[:farmer_id])
    render json: farmer, status: :ok
  end

  private 
  def farmer_params
    params.permit(:name, :town, :phone, :username, :password, :password_confirmation)
  end

  def render_unprocessable_entity_json_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :farmer_id
  end
end

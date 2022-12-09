class ProducesController < ApplicationController
  wrap_parameters format: []
  before_action :authorize
  skip_before_action :authorize, only: [:index, :show]

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response 

  # create, index, show, update, delete

  # POST /produce
  def create 
    # farmer = Farmer.find_by(id: session[:farmer_id])
    # produce = farmer.produces.create!(produce_params)
    produce = Produce.create!(produce_params)
    render json: produce, status: :created
    # , include: {user: {only: [:username, :image_url, :bio]}}
  end

  # GET /produce
  def index 
    produces = Produce.all 
    render json: produces, status: :ok 
    # , include: {user: {only: [:username, :image_url, :bio]}}
  end

  # GET /produce/:id
  def show 
    produce = Produce.find(params[:id])
    render json: produce, status: :ok
  end

  # PATCH /produce/:id
  def update
    # farmer = Farmer.find_by(id: session[:farmer_id])
    # produce = farmer.produces.update!(produce_params)
    produce = Produce.find(params[:id])
    produce.update!(produce_params)
    render json: produce, status: :accepted
  end

  # DELETE /produce/:id
  def destroy 
    # farmer = Farmer.find_by(id: session[:farmer_id])

    produce = Produce.find(params[:id])
    produce.destroy
    head :no_content
    # render json: {}, status: :no_content
  end 

  private 
  def authorize
    return render json: { errors: ["Unauthorized! You must be logged in as a farmer to perform this action."]}, status: :unauthorized unless session.include? :farmer_id
  end

  def produce_params
    params.permit(:name, :quantity, :units, :unit_price, :img_url) 
  end

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def render_record_not_found_response
    render json: {error: "Produce not found"}, status: :not_found
  end
end

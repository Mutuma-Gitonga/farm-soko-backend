class ConsumersController < ApplicationController
  wrap_parameters format: []
  before_action :authorize
  skip_before_action :authorize, only: [:create]

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_json_response

  def create 
    consumer = Consumer.create!(consumer_params)

    session[:consumer_id] = consumer.id 
    render json: consumer, status: :created 
  end

  def show 
    consumer = Consumer.find(session[:consumer_id])
    render json: consumer, status: :ok
  end

  private 
  def consumer_params
    params.permit(:name, :town, :phone, :username, :password, :password_confirmation)
  end

  def render_unprocessable_entity_json_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

  def authorize
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :consumer_id
  end
end

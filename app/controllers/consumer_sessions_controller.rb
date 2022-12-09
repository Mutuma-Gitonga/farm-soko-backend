class ConsumerSessionsController < ApplicationController
  def create
    consumer = Consumer.find_by(username: params[:username])
    
    if consumer&.authenticate(params[:password])
      session[:consumer_id] = consumer.id
      render json: consumer, status: :created
    else
      render json: { error: "Invalid username or password" }, status: :unauthorized
    end
  end

  def destroy 
    session.delete :consumer_id
    head :no_content
  end
end

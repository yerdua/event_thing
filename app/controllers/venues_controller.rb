class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @venues }
    end
  end
  
  def create
    @venue = Venue.new(params[:venue])
    
    if @venue.save
      render json: @venue
    else
      render json: @venue.errors.full_messages, status: 422
    end
  end
  
  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(params[:venue])
    
    if @venue.save
      render json: @venue
    else
      render json: @venue.errors.full_messages, status: 422
    end
  end
    
end

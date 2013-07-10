class EventsController < ApplicationController
  before_filter :require_user!
  
  def create
    @event = current_user.events.build(params[:event])
    
    if @event.save
      render json: @event
    else
      render json: @event.errors.full_messages, status: 422
    end
  end
  
  def new
    @event = Event.new
  end
  
  def index
    @events = Event.all;
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end

end

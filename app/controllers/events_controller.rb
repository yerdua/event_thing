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
  
  def index
    if params[:user_id]
      @user = User.includes(:events).find(params[:user_id])
      @events = @user.events
    else
      @events = Event.all;
    end
    
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events }
    end
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find(params[:id])
    render json: @event
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    
    if @event.save
      render json: @event
    else
      render json: @event.errors.full_messages, status: 422
    end
  end

end

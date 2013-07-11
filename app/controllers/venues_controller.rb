class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @venues }
    end
  end
end

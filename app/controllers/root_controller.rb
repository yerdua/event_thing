class RootController < ApplicationController
  before_filter :require_user!
  
  def root
  end
end

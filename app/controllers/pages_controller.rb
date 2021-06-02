class PagesController < ApplicationController
  before_action  :set_event, only: [:show]

  def index
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end

  end

  def show
    
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end


end
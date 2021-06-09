class PagesController < ApplicationController
  before_action  :set_event, only: [:show]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tickets, only: [:my_tickets] 
  def index
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end

  end

  def show
    render layout: 'main'

  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_tickets
    @tickets= Ticket.where(user_id: current_user.id)

  end


end
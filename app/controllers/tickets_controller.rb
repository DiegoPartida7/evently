class TicketsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tickets, only: [:index] 
  before_action :set_ticket, only: [:show] 

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

  def create_ticket
    @event= Event.find(params[:event_id])
    seats = params[:seat]
    seats.each do |seatt|
      Ticket.create!(user_id: current_user.id, event_id: @event.id, seat_number: seatt)
      @event.sold << seatt
      @event.save!
    end

    redirect_to root_path, notice: 'Has comprado boletos!'
  end


  private

  def set_tickets
    @tickets= Ticket.where(user_id: current_user.id)
  end

  def set_ticket
    @ticket= Ticket.find(params[:id])
    @event= Event.find(@ticket.event_id)
  end

end
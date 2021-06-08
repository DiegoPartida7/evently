class PagesController < ApplicationController
  before_action  :set_event, only: [:show]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end

  end

  def show
    Rails.logger.info "-------------------------------------------------------------------------------"

  end

  def create_ticket
    @event= Event.find(params[:event_id])
    seats = params[:seat]
    Rails.logger.info "-------------------------------------------------------------------------------"
    Rails.logger.info "#{@event.id}"
    Rails.logger.info "-------------------------------------------------------------------------------"
    Rails.logger.info "#{current_user.id}"
    Rails.logger.info "-------------------------------------------------------------------------------"
    Rails.logger.info "#{seats}"
    Rails.logger.info "-------------------------------------------------------------------------------"
    Rails.logger.info "#{seats[0]}"
    # Ticket.create!(user_id: current_user.id, event_id: @event.id, seat_number: 1)

    seats.each do |seatt|
      Ticket.create!(user_id: current_user.id, event_id: @event.id, seat_number: seatt)
      @event.sold << seatt
      @event.save!
    end
    # @ticket = Ticket.new

    # # @ticket = @event.tickets.create!(user_id: current_user.id, event_id: @event.id, seat_number: 1)
    # @ticket.save!
    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end


end
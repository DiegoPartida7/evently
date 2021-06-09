class EventsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_events, only: [:index]
  before_action :set_event, only: [:edit, :update, :show]

  def index
    render layout: 'main'
  end

  def show
    render layout: 'main'
  end

  def new
    @event = Event.new

    render layout: 'main'
  end

  def create 
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to root_path, notice: "Se ha creado el evento"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

    unless current_user == @event.user
      redirect_back fallback_location: root_path, notice: 'El usuario no es dueño'
    end

    render layout: 'main'
  end

  def update
    if @event.update event_params
      redirect_to my_events_path, notice: "Se ha modificado el evento"
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def private_show
    @event = Event.where(auth_token: params[:auth_token]).first
    render layout: 'main'
  end

  private

  def event_params
    params.require(:event).permit(:title, :tickets_available, :description, :location, :date, :event_type, :price, :image)
  end


  def set_events
    @events = Event.where(user_id: current_user.id)
    @private_events = @events.where(event_type: 'Closed')
    @open_events = @events.where(event_type: 'Open')
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
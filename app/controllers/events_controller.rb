class EventsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:show]
  
  before_action :set_events, only: [:index]
  before_action :set_event, only: [:edit, :update, :show]
  before_action :set_private_event, only: [:destroy]
  layout "main"
  
  def index

    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end

  end

  def show
    if current_user
      render layout: 'main'
    else
      render layout: 'application'
    end
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
    
    if current_user != @event.user
      redirect_back fallback_location: root_path, notice: 'El usuario no es dueño'
    end
    
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
  end

  def destroy
    @event.destroy!
    redirect_to root_path, notice: "borraste el evento"
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
    @event = Event.find(params[:id]).decorate
  end

  def set_private_event
    @event = Event.where(auth_token: params[:auth_token]).first
  end

end
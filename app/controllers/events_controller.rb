class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    render json: {events: @events}, status: 200
  end

  def show
    render json: {event: @event}, status: 200
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {message: 'Event successfully created!',event: @event}, status: 200
    else
      render json: {message: @event.errors.full_messages}
    end
  end

  def update
    if @event.update(event_params)
      render json: {message: 'Update successfully'}, status: 200
    else
      render json: {message: @event.errors.full_messages}
    end
  end

  def destroy
    if @event.destroy
      render json: {message: 'Event successfully destroy!'}, status: 200
    else
      render json: {message: @event.errors.full_messages}
    end
  end

  private

    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:event_name, :event_description, :event_date, :event_time, :event_address, :temple_id,)
    end
end

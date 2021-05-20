class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def new
    @event=Event.find(params[:event_id])
  end

  def create
    @attendance = Attendance.create(stripe_customer_id: params[:strip_id], event_id: params[:event_id], user_id: current_user.id)
    if @attendance.save
      url = "/events/#{params[:event_id]}"
      redirect_to url
    else
      @alert = true
      render '/attendances/new'
    end
  end

  def index
    @event = Event.find(params[:event_id])
    @list_of_participants = Attendance.get_participants(@event)
  end

end

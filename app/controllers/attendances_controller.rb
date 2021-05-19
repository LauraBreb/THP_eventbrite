class AttendancesController < ApplicationController
  def new
  end

  def create
    @attendance = Attendance.create(stripe_customer_id: params[:strip_customer_id], event_id: params[:event_id], user_id: current_user.id)
    if @attendance.save
      url = "/events/#{params[:event_id]}"
      redirect_to url
    else
      @alert = true
      render '/attendances/new'
    end
  end
end

class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    
  end

  def new
  end

  def create
    @event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
    @event.administrator_id = current_user.id
    @event.save
    if @event.save
      url = "/events/#{@event.id}"
      redirect_to url
    else
      @alert = true
      render '/events/new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    post_params = params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    if @event.update(post_params)
      flash.now[:success]
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to "/"
  end
end

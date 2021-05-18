class EventsControllerController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  def index
  end
end

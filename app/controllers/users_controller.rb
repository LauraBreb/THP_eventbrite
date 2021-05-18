class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :user_profil_match!, only: [:show, :edit]
  
  def show
    @user = current_user
    @events = @user.find_user_events
  end

  def edit
    @user = current_user
    @events = @user.find_user_events
  end

  def update
    puts "$" * 50
    puts params
    puts "$" * 50
    @user = User.find(params[:id])
    post_params = params.require(:user).permit(:first_name, :last_name, :description)
    if @user.update(post_params)
      flash.now[:success]
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  # def user_profil_match!
  #   User.find(params[:id])==current_user
  # end
end

class UserMailer < ApplicationMailer
  default from: "breb.laura@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Bienvue sur l'appli eventbrite !")
  end

  def event_validation_email(user)
    @user = user
    mail(to: @user.email, subject: "Votre participation est confirmée !")
  end


end

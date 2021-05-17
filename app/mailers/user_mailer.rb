class UserMailer < ApplicationMailer
  default from: "no-reply@evenbrite.fr"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: 'breb.laura@gmail.com', subject: "Bienvue sur l'appli eventbrite !")
  end


end

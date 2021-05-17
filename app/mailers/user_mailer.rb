class UserMailer < ApplicationMailer
  default from: "breb.laura@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Bienvue sur l'appli eventbrite !")
  end

  def event_participation_email(attendance)
    @attendance = attendance
    mail(to: @attendance.event.administrator.email, subject: "Un participant s'est inscrit à votre évènement !")
  end


end

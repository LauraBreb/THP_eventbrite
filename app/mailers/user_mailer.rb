class UserMailer < ApplicationMailer
  default from: "laurabreb123@yopmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Bienvenue sur l'appli eventbrite !")
  end

  def event_participation_email(attendance)
    @attendance = attendance
    mail(to: @attendance.event.administrator.email, subject: "Un participant s'est inscrit à votre évènement !")
  end


end

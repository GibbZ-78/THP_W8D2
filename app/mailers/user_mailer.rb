class UserMailer < ApplicationMailer

  default from: 'jb.vidal@gmail.com'
 
  def welcome_email(my_user)
    @user = my_user 
    @url  = 'https://gibbz-event-hack.herokuapp.com/' 
    mail(to: @user.email, subject: "Bienvenue sur Event Hack, #{@user.first_name} !") 
  end

end

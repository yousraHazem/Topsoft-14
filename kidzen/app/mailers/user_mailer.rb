# Authors: Shary Beshara
class UserMailer < ActionMailer::Base

# set the default email that emails would be sent from 
  default from: "kidzennetwork@gmail.com"

# this method will send an account verification email to the gaurdian email of # the child that passed to it
  def account_verification(sign_up)
    @sign_up = sign_up
    mail(:to => @sign_up.gaurdian_email, :subject => 'hi')
  end

end

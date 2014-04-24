# Authors: Shary Beshara
class UserMailer < ActionMailer::Base

# Set the default email to send from. 
  default from: "kidzennetwork@gmail.com"

  # This method sends a verification email.
  # child - child to send email to
  # Email is sent to the child's gaurdian email attribute
  # Authors: Shary Beshara
  def account_verification(child)
    @child = child
    # TODO: add dynamic mail content, link and subject. 
    mail(:to => @child.guardian_email, :subject => 'hi')
  end

  # This method sends an invitation email to the email 
  # email - the email that the invitation should be sent
  # supervisor - is the supervisor that sends the invitations
  # Authors: Shary Beshara
  def invite_others(email,supervisor)
    @supervisor = supervisor
    @email = email
    mail(:to => @email, :subject => 'invitation')
  end

  # This method sends a notification email 
  # email- is the email of the registered user that the notification will be  # sent
  # notification - is the notification will be sent by email
  # Authors: Shary Beshara
  def notification_by_email(email, notification)
    @email = email
    @notification = notification
    mail(:to => @email, :subject => @notification.title)
  end

end

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

end

# Authors: Ahmed H. Ismail
class ChildController < ApplicationController

  # Adds a new friendship entry.
  # child_1 - first child.
  # child_2 - second child.
  # Authors: Ahmed H. Ismail.
  def create_friendship(child_1, child_2)
    FriendShip.create(child_1_id: child_1.id, child_2_id: child_2.id)
  end

  def new
    UserMailer.account_verification.deliver #after creating the sign up we will pass the email
  end

  def verify
    @child.is_approved = true
  end

   def add_daily_activities(child,daily_activity)
        DailyActivitesChild.create(child_id: child.id,activity_id: daily_activity.id,adder_id: child.id)
       #table name is DailyActivitesChild with attributes daily_activity.id,adder_id,child_id
       #adder_id is the id of the user who added the daily activity(child or supervisor)
    end 
  
end

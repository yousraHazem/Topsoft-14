class Calendar < Struct.new(:view, :date, :callback)
  HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
#START_DAY is for deciding the day the table of Calendar should start at , in our case it is sunday
  START_DAY = :sunday
  delegate :content_tag, to: :view
#Here we define the table of the Calendar
#Parameters : None
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def table
   content_tag :table, class: "calendar table table-bordered table-striped" do
     header + week_rows
   end
 end
#Here we create the head of the table i.e. days row
#Parameters : None
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def header
   content_tag :tr do
     HEADER.map { |day| content_tag :th, day }.join.html_safe
   end
 end
#Here we create our normal days rows
#Parameters : None
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def week_rows
   weeks.map do |week|
     content_tag :tr do
       week.map { |day| day_cell(day) }.join.html_safe
     end
   end.join.html_safe
 end
#Here we get the number of the day
#Parameters : day
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def day_cell(day)
   content_tag :td, view.capture(day, &callback), class: day_classes(day)
 end
#Here we change months
#Parameters : day
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def day_classes(day)
   classes = []
   classes << "today" if day == Date.today
   classes << "not-month" if day.month != date.month
   classes.empty? ? nil : classes.join(" ")
 end
#Here we define the begging and the end of a week
#Parameters : None
#Returns : None
#Complexity : O(1)
#Author : Abdelrahman Saad
 def weeks
   first = date.beginning_of_month.beginning_of_week(START_DAY)
   last = date.end_of_month.end_of_week(START_DAY)
   (first..last).to_a.in_groups_of(7)
 end
end

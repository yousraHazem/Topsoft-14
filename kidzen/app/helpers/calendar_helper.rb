module CalendarHelper
# Defines the calendar parameters and creates a new instance of it
# Parameters : date
# Returns : new instance of Calendar
# Time Complexity : O(1)
# Author : Abdelrahman Saad
    def calendar(date = Date.today, &block)
      Calendar.new(self, date, block).table
    end
end

module Exceptions
  class IncorrectNotificationOwner < StandardError
    def initialize(message)
      super(message)
    end
  end
end
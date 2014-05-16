# Module defining exceptions used by models and controllers.
# Authors: Ahmed H. Ismail
module Exceptions
  
  # Signals an incorrect Child parameter while creating
  # a Child entity.
  # Authors: Ahmed H. Ismail.
  class ChildParamsError < ArgumentError
    def initialize(message)
      super(message)
    end    
  end

  # Signals an incorrect Permission parameter while creating
  # a Permission entity.
  # Authors: Ahmed H. Ismail.
  class PermissionParamsError < ArgumentError
    def initialize(message)
      super(message)
    end
  end

  # Signals problem with user Authentication.
  # Authors: Ahmed H. Ismail.
  class AuthenticationError < StandardError
    def initialize(message)
      super(message)
    end
  end

  # Signals an incorrect RegisteredUser parameter while creating
  # a RegisteredUser entity.
  # Authors: Ahmed H. Ismail.
  class RegisteredUserParamsError < ArgumentError
    def initialize(message)
      super(message)
    end
  end

  # Signals an incorrect Supervisor parameter while creating
  # a Supervisor entity.
  # Authors: Ahmed H. Ismail.
  class SupervisorParamsError < ArgumentError
    def initialize(message)
      super(message)
    end
  end

end
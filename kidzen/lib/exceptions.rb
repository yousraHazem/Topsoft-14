module Exceptions
  
  class ChildParamsError < ArgumentError
    def initialize(message)
      super(message)
    end    
  end

  class PermissionParamsError < ArgumentError
    def initialize(message)
      super(message)
    end
  end

  class AuthenticationError < StandardError
    def initialize(message)
      super(message)
    end
  end

  class RegisteredUserParamsError < ArgumentError
    def initialize(message)
      super(message)
    end
  end

end
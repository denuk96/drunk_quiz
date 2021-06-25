module CustomErrors
  class SessionAuthError < StandardError
    def initialize(msg = 'User has not been found in current session for current game')
      super
    end
  end
end

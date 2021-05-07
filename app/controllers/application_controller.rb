class ApplicationController < ActionController::Base
  include GameAuthConcern
  include ExceptionHandlerConcern
end

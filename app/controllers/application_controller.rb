class ApplicationController < ActionController::Base
  include Clearance::Controller
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
end

module Admin
  class BaseController < ApplicationController
  	before_filter :verify_admin

	def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end
	
	private
	  def verify_admin
  	  redirect_to root_path unless current_user.try(:admin?)
	  end
  end
end
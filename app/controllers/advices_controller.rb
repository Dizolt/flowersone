class AdvicesController < ApplicationController
    before_action :find, only: [:show]

  	def index
  	  @advices = Advice.all.paginate(:page => params[:page], :per_page => 5)
  	end

  	def show
  	end

  	def new
  	end

  	def create
  	end

  	def update
  	end

  	def destroy
  	end

  	private
      def find
        @advice = Advice.find(params[:id])
      end
end

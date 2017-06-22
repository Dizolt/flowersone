class BouquetsController < ApplicationController
    before_action :find, only: [:show]

  	def index
  	  @bouquets = Bouquet.all.paginate(:page => params[:page], :per_page => 5)
  	end

  	def show
  	end

  	def create
  	end

  	def update
  	end

  	def destroy
  	end

  	private
      def find
        @bouquet = Bouquet.find(params[:id])
      end
end

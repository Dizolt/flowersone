module Admin
  class BouquetsController < BaseController
    before_action :find, only: [:show, :edit, :update, :destroy]
  	load_and_authorize_resource
  	layout "admin"

  	def index
  	  @bouquets = Bouquet.all
  	end

  	def show
  	end

  	def new
  	  @bouquet = Bouquet.new
  	end

  	def create
  	  @bouquet = Bouquet.create(bouquet_params)
      if @bouquet.errors.empty?
        redirect_to admin_bouquets_path
      else
        render :new
      end
  	end

  	def edit
  	end

  	def update
  	  @bouquet.update(bouquet_params)
      if @bouquet.errors.empty?
      	redirect_to admin_bouquet_path(@bouquet)
      else
      	render "edit"
      end
  	end

  	def destroy
  	  @bouquet.destroy
      redirect_to admin_bouquets_path
  	end

  	private
      def find
        @bouquet = Bouquet.find(params[:id])
      end

      def bouquet_params
        params.require(:bouquet).permit(:name, :title, :description, :price, :availability, attachments_attributes: [:id, :img, :attachmentable_id, :attachmentable_type, :_destroy])
      end
  end
end
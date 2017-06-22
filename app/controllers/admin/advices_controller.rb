module Admin
  class AdvicesController < BaseController
    before_action :find, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  	layout "admin"

  	def index
  	  @advices = Advice.all
  	end

  	def show
  	end

  	def new
  	  @advice = Advice.new
  	end

  	def create
  	  @advice = Advice.create(advice_params)
      if @advice.errors.empty?
        redirect_to admin_advices_path
      else
        render :new
      end
  	end

  	def edit
  	end

  	def update
  	  @advice.update(advice_params)
      if @advice.errors.empty?
      	redirect_to admin_advice_path(@advice)
      else
      	render "edit"
      end
  	end

  	def destroy
  	  @advice.destroy
      redirect_to admin_advices_path
  	end

  	private
      def find
        @advice = Advice.find(params[:id])
      end

      def advice_params
        params.require(:advice).permit(:name, :description, :title, attachments_attributes: [:id, :img, :attachmentable_id, :attachmentable_type, :_destroy])
    end
  end
end

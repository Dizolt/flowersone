module Admin
  class SlidersController < BaseController
    load_and_authorize_resource
  	layout "admin"

    def index
      @slides = Attachment.where(attachmentable_type: "Slider").all 
    end

    def show
      #show
    end

    def new
      @slider = Slider.new
    end

    def create
      @slider = Slider.create(slider_params)
      if @slider.errors.empty?
        redirect_to admin_sliders_path
      else
        render :new
      end
    end

    def edit
    end

    private

      def find
        @slide = Slider.find(params[:id])
      end

      def slider_params
        params.require(:slider).permit(attachments_attributes: [:id, :img, :attachmentable_id, :attachmentable_type, :_destroy])
      end
  end
end

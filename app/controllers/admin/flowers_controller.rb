module Admin
  class FlowersController < BaseController
    before_action :find, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  	layout "admin"

    def index
      @filterrific = initialize_filterrific(
        Flower,
        params[:filterrific],
        select_options: {
          by_category: Flower.options_for_select,
        },
      ) || return
      flowers = @filterrific.find
      flowers = flowers.all
      @flowers = flowers.page(params[:page]).paginate(:page => params[:page], per_page: 15)

      respond_to do |format|
        format.html
        format.js
      end
    end

    def show
      #show
    end

    def new
      @flower = Flower.new
    end

    def create
      @flower = Flower.create(flower_params)
      if @flower.errors.empty?
        redirect_to admin_flower_path(@flower)
      else
        render :new
      end
    end

    def edit
    end

    def update
      @flower.update(flower_params)
      if @flower.errors.empty?
      	redirect_to admin_flower_path(@flower)
      else
      	render "edit"
      end
    end

    def destroy
      @flower.destroy
      redirect_to admin_flowers_path
    end

    private

      def find
        @flower = Flower.find(params[:id])
        @category = Category.where(id: @flower.category_id)
      end

      def flower_params
        params.require(:flower).permit(:name, :description, :price, :availability, :category_id, :published, attachments_attributes: [:id, :img, :attachmentable_id, :attachmentable_type, :_destroy])
      end
  end
end

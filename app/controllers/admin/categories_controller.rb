module Admin
  class CategoriesController < BaseController
    before_action :find, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
  	layout "admin"

  	def index
  	  @categories = Category.all.order(name: :asc)
  	end

  	def show
  	end

  	def new
  	  @category = Category.new
  	end

  	def create
  	  @category = Category.create(category_params)
      if @category.errors.empty?
        redirect_to admin_categories_path
      else
        render :new
      end
  	end

  	def edit
  	end

  	def update
  	  @category.update(category_params)
      if @category.errors.empty?
      	redirect_to admin_categories_path
      else
      	render "edit"
      end
  	end

  	def destroy
  	  @category.destroy
      redirect_to admin_categories_path
  	end

  	private

      def find
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :image)
      end
  end
end

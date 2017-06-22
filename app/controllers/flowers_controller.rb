class FlowersController < ApplicationController
  before_action :find, only: [:show]

  def index
  	@flowers = Flower.where(category_id: params[:category_id]).all.paginate(:page => params[:page], :per_page => 10)
    @category = Category.where(id:  params[:category_id]).first
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
      @flower = Flower.find(params[:id])
    end
end

class CategoriesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.all.order(name: :asc)
  	@ez = Flower.where(category_id: @category).all
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
      @category = Category.find(params[:id])
    end
end
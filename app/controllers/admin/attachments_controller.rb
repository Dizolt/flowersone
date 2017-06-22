module Admin
  class AttachmentsController < ApplicationController
  	before_action :find_item, only: [:show, :create, :update, :destroy]

    def index
      # index
    end

    def show
      # show
    end

    def new
      # new
    end

    def create
      # create
    end

    def edit
      # edit
    end

    def update
      # update
    end

    def destroy
      @img.destroy
      redirect_back(fallback_location: "edit_admin_#{params[:attachmentable_type]}_path")
    end

    private

    def find_item
      @img = Attachment.find(params[:id])
    end
  end
end

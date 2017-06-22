class SlidersController < ApplicationController

  def index
    @slides = Attachment.where(attachmentable_type: "Slider").all
    @new = Flower.last(5);
  end

end

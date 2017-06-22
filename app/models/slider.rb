class Slider < ApplicationRecord
  has_many :attachments, as: :attachmentable, inverse_of: :attachmentable, :dependent => :destroy

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
end

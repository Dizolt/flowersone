class Advice < ApplicationRecord
  has_many :attachments, as: :attachmentable

  validates :title, length: { maximum: 300 }
  validates :name, presence: true

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
end

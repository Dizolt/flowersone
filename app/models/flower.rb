class Flower < ApplicationRecord
  belongs_to :category
  has_many :attachments, as: :attachmentable, inverse_of: :attachmentable
 
  validates :name, :price, :availability, presence: true
  validates :price, :availability, numericality: { greater_than_or_equal_to: 0 }

  def self.options_for_select
    Region.all.map { |e| [e.name, e.id] }
  end

  filterrific(
    available_filters: [
      :by_category,
    ],
  )

  scope :by_category, lambda { |i| Flower.where(category_id: i) }

  def self.options_for_select
    Category.all.map { |e| [e.name, e.id] }
  end

  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
end

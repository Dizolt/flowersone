class Attachment < ApplicationRecord
  belongs_to :attachmentable, polymorphic: true

  has_attached_file :img, :styles => { medium: "300x300>", thumb: "100x100>", small: "270x350#", preview: "480x480#", large: "480x480#" },
  :url => "/system/:attachment/:id/:basename_:style.:extension"
  validates_attachment_content_type :img, content_type: ["image/jpeg", "image/jpg", "image/png"]
end

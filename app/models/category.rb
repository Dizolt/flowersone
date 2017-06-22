class Category < ApplicationRecord
  has_many :flowers
  has_many :attachments, as: :attachmentable
  validates :name, presence: true

  has_attached_file :image, 
  :url => "/system/:attachment/:id/:basename_:style.:extension",
  :styles => {
    :thumb    => ['100x100#',  :jpg, :quality => 70],
    :small    => ['150x150!',  :jpg, :quality => 70],
    :medium   => ['270x350#',  :jpg, :quality => 70],
    :preview  => ['480x480#',  :jpg, :quality => 70],
    :large    => ['600>',      :jpg, :quality => 70],
    :retina   => ['1200>',     :jpg, :quality => 30]
  },
  :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :large    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  }
  validates_attachment_content_type :image, content_type: ["image/jpeg", "image/jpg", "image/png"]
end

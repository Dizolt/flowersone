class AddAttachmentImgToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :attachments, :img
  end
end

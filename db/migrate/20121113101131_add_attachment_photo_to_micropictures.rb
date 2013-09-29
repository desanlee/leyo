class AddAttachmentPhotoToMicropictures < ActiveRecord::Migration
  def self.up
    change_table :micropictures do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :micropictures, :photo
  end
end

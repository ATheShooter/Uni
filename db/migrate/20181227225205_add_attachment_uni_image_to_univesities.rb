class AddAttachmentUniImageToUnivesities < ActiveRecord::Migration[5.2]
  def self.up
    change_table :universities do |t|
      t.attachment :uni_image
    end
  end

  def self.down
    remove_attachment :universities, :uni_image
  end                  
end

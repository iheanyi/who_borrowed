class RemoveAttachmentFromItems < ActiveRecord::Migration
  def change
    remove_attachment :items, :image
  end
end

class AddImageAttachmentToActivities < ActiveRecord::Migration[6.0]
  def up
    add_attachment :activities, :image
  end

  def down
    add_attachment :activities, :image
  end
end

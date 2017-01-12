class AddAttachmentToRestaurant < ActiveRecord::Migration[5.0]
  def up
    add_attachment :restaurants, :image
  end

  def down
    remove_attachment :restaurants, :image
  end
end

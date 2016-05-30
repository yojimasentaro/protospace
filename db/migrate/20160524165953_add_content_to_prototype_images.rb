class AddContentToPrototypeImages < ActiveRecord::Migration
  def change
    add_column :prototype_images, :content, :string
    add_column :prototype_images, :role,  :integer
  end
end

class AddCatchcopyToPrototypes < ActiveRecord::Migration
  def change
    add_column :prototypes, :catch_copy, :string
    add_column :prototypes, :concept,    :text
  end
end

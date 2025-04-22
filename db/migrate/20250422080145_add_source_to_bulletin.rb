class AddSourceToBulletin < ActiveRecord::Migration[8.0]
  def change
    add_column :bulletins, :source, :string
  end
end

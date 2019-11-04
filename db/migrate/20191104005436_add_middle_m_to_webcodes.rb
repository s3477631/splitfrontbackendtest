class AddMiddleMToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :middle_m, :string
  end
end

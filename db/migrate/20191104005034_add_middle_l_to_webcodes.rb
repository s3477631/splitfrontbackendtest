class AddMiddleLToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :middle_l, :string
  end
end

class AddMiddleRToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :middle_r, :string
  end
end

class AddTopLToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :top_l, :string
  end
end

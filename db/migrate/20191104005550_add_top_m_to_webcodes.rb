class AddTopMToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :top_m, :string
  end
end

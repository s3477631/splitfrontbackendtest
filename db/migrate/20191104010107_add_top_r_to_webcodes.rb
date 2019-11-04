class AddTopRToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :top_r, :string
  end
end

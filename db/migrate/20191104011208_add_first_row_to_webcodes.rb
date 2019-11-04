class AddFirstRowToWebcodes < ActiveRecord::Migration[5.2]
  def change
    add_column :webcodes, :firstRow, :string
    add_column :webcodes, :secondRow, :string
    add_column :webcodes, :thirdRow, :string
  end
end

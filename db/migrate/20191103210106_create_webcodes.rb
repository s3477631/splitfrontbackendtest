class CreateWebcodes < ActiveRecord::Migration[5.2]
  def change
    create_table :webcodes do |t|
      t.string :bottom_l
      t.string :bottom_m
      t.string :bottom_r

      t.timestamps
    end
  end
end

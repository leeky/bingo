class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :image
      t.timestamps
    end
  end
end

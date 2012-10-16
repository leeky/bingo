class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :name
      t.references :font
      t.integer :quantity
      t.integer :columns
      t.integer :rows
      t.integer :ascii
      t.references :theme
      t.timestamps
    end
  end
end

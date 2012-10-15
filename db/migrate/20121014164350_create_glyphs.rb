class CreateGlyphs < ActiveRecord::Migration
  def change
    create_table :glyphs do |t|
      t.string :name
      t.integer :ascii
      t.references :font
      t.timestamps
    end
  end
end

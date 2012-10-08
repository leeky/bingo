class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :typeface
      t.timestamps
    end
  end
end

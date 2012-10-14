class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.references :font
      t.references :picture
      t.timestamps
    end

    create_table :fonts_themes do |t|
      t.references :theme
      t.references :font
    end

    create_table :pictures_themes do |t|
      t.references :theme
      t.references :picture
    end
  end
end

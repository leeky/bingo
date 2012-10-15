class AddDingbatsToFonts < ActiveRecord::Migration
  def change
    add_column :fonts, :dingbat, :boolean, :default => true
  end
end

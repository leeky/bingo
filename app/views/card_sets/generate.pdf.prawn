require 'prawn/measurement_extensions'

# Register Fonts
font_families.update("title" => { :normal => "#{@card_set.font.typeface.path}" })

@fonts.each do |f|
  font_families.update("font#{f.id}" => { :normal => "#{f.typeface.path}" })
end

# Define Layout Grid
define_grid(columns: @columns, rows: (@rows + 1), gutter: 0)

# Title
grid([0,0], [0,@columns-1]).bounding_box do
  font 'title' do
    fill_color "ff0000"
    text_box "#{@title}", width: bounds.width, height: bounds.height, overflow: :shrink_to_fit, align: :center, valign: :center, size: 72.pt
    fill_color "000000"
  end
end

grid.show_all
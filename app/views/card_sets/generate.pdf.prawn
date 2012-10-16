require 'prawn/measurement_extensions'

# Register Fonts
font_families.update("title" => { :normal => "#{@card_set.font.typeface.path}" })

@fonts.each do |f|
  font_families.update("font#{f.id}" => { :normal => "#{f.typeface.path}" })
end

(1..@pages).each do |page|

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

  @shuffled_cards = @cards.shuffle[0...(@rows * @columns)]

  r = 1

  @shuffled_cards.in_groups_of(@columns) do |card_row|
    c = 0
    card_row.each do |card|
      grid(r,c).bounding_box do
        stroke_bounds

        gx = bounds.left
        gy = bounds.top
        gw = bounds.width
        gh = bounds.height

        bounding_box([gx+2.mm,gy-2.mm], width: gw-4.mm, height: gh-15.mm) do
          if card.is_a?(Glyph)
            font ("font#{card.font.id}") do
              text card.ascii.chr, align: :center, valign: :center, overflow: :shrink_to_fit, size: 80.pt
            end
          else
            image "#{card.image.path}", fit: [gw-4.mm, gh-15.mm], position: :center, vposition: :center
          end
        end

        bounding_box([gx+2.mm,gy-gh+10.mm], width: gw-4.mm, height: 8.mm) do
          text card.name, overflow: :shrink_to_fit, size: 18.pt, align: :center, valign: :center, style: :bold
        end

      end
      c += 1
    end
    r += 1
  end

  start_new_page unless page == @pages
end
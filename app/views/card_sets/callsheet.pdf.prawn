require 'prawn/measurement_extensions'

# Register Fonts
@fonts.each do |f|
  font_families.update("font#{f.id}" => { :normal => "#{f.typeface.path}" })
end

logger.info "Generating call sheet for #{@cards.count} bingo cards."

# Define Layout Grid
define_grid(columns: 3, rows: 3, gutter: 0)

@number_of_pages = (@cards.count.to_f / 9).ceil.to_i
@current_page = 1

@cards.shuffle.in_groups_of(9) do |page|
  text @card_set.name + ' Call Sheet - page ' + @current_page.to_s + ' of ' + @number_of_pages.to_s
  bounding_box([bounds.left, bounds.top-10.mm], width: bounds.width, height: bounds.height-10.mm) do

    (0..2).each do |y|
      (0..2).each do |x|
        grid(y,x).bounding_box do

          card = page[x+(y*3)]

          gx = bounds.left
          gy = bounds.top
          gw = bounds.width
          gh = bounds.height

          bounding_box([gx+2.mm,gy-2.mm], width: gw-4.mm, height: gh-15.mm) do
            if card.is_a?(Glyph)
              font ("font#{card.font.id}") do
                text card.ascii.chr, align: :center, valign: :center, overflow: :shrink_to_fit, size: 80.pt
              end
            elsif card.is_a?(Picture)
              image "#{card.image.path}", fit: [gw-4.mm, gh-15.mm], position: :center, vposition: :center
            end
          end

          unless card.is_a?(NilClass)
            bounding_box([gx+2.mm,gy-gh+10.mm], width: gw-4.mm, height: 8.mm) do
              text card.name, overflow: :shrink_to_fit, size: 18.pt, align: :center, valign: :center, style: :bold
            end

            stroke_bounds
          end

        end
      end
    end

  end

  @current_page += 1

  start_new_page unless page[8].nil?
end
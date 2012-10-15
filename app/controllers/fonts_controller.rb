class FontsController < ApplicationController

  def index
    @fonts = Font.all

    @font = Font.new
  end

  def new
    @font = Font.new
  end

  def create
    @font = Font.new(params[:font])

    if @font.save
      redirect_to fonts_path, notice: 'Font was successfully uploaded.'
    else
      render 'new'
    end
  end

  def edit
    @font = Font.find(params[:id])

    if @font.dingbat?
      @glyphs = @font.glyphs.collect(&:ascii)

      # FIXME: This is a mess and needs refactoring
      (33..126).each do |char|
        unless @glyphs.include?(char)
          @font.glyphs.build(ascii: char)
        end
      end
    end

  end

  def update
    @font = Font.find(params[:id])
    @glyphs = @font.glyphs

    if @font.update_attributes(params[:font])
      redirect_to fonts_path, notice: 'Font was successfully updated.'

      if @font.dingbat?
        # FIXME: This is a mess and needs refactoring
        params[:glyph].each do |k,v|
          unless v[:name].blank?
            @glyph = @font.glyphs.find_or_create_by_ascii(k)
            @glyph.name = v[:name].to_s
            @glyph.save
          else
            @glyph = @font.glyphs.find_by_ascii(k)
            @glyph.destroy if @glyph
          end
        end
      end
    else
      render action: "edit"
    end
  end

  def destroy
    @font = Font.find(params[:id])
    @font.destroy

    redirect_to fonts_path, notice: 'Font was successfully deleted.'
  end
end
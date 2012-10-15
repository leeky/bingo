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
    @font.glyphs.build

    @glyphs = Glyph.where(font_id: @font).all
  end

  def update
    @font = Font.find(params[:id])

    if @font.update_attributes(params[:font])
      redirect_to fonts_path, notice: 'Font was successfully updated.'
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
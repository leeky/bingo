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

  def destroy
    @font = Font.find(params[:id])
    @font.destroy

    redirect_to fonts_path, notice: 'Font was successfully deleted.'
  end
end
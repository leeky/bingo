class PicturesController < ApplicationController

  def index
    @pictures = Picture.all

    @picture = Picture.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(params[:picture])

    if @picture.save
      redirect_to pictures_path, notice: 'Picture was successfully stored.'
    else
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to pictures_path, notice: 'Picture was successfully deleted.'
  end
end
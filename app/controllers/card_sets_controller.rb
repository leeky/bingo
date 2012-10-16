class CardSetsController < ApplicationController
  prawnto prawn: { page_size: 'A4', page_layout: :landscape, margin: 20 }

  def index
    @card_sets = CardSet.all

    @card_set = CardSet.new
  end

  def new
    @card_set = CardSet.new
  end

  def create
    @card_set = CardSet.new(params[:card_set])

    if @card_set.save
      redirect_to card_sets_path, notice: 'Card Set was created.'
    else
      render 'new'
    end
  end

  def edit
    @card_set = CardSet.find(params[:id])
  end

  def update
    @card_set = CardSet.find(params[:id])

    if @card_set.update_attributes(params[:card_set])
      redirect_to card_sets_path, notice: 'Card Set was updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @card_set = CardSet.find(params[:id])
    @card_set.destroy

    redirect_to card_sets_path, notice: 'Card Set was deleted.'
  end

  def generate
    @card_set   = CardSet.find(params[:id])

    @title      = @card_set.name
    @title_font = @card_set.font
    @theme      = @card_set.theme
    @pictures   = @theme.pictures
    @fonts      = @theme.fonts.where(dingbat: true)

    @quantity   = @card_set.quantity
    @columns    = @card_set.columns
    @rows       = @card_set.rows

    respond_to do |format|
      format.pdf
    end

  end
end
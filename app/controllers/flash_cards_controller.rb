class FlashCardsController < ApplicationController
  def index
    # TODO Implement a Limit and Offset to limit the size of the query
    # Also, Random is really really bad
    @flash_cards = FlashCard.order("RANDOM()")
    render json: @flash_cards
  end

  def new
    @flash_card = FlashCard.new
  end

  def create
    @flash_card = FlashCard.new(flash_card_params)
    @flash_card.set_id = 1 # remove once card sets have been implemented

    if @flash_card.save
      flash[:notice] = 'Flash Card was successfully created.'
      redirect_to root_url
    else
      flash[:error] = @flash_card.errors.full_messages
      render :new, flash_card: @flash_card
    end
  end

  def show
    @flash_card = FlashCard.where(id: params[:id]).first
    render json: @flash_card
  end

  private
  def flash_card_params
    params.require(:flash_card).permit(:response, :stimulus, :set_id)
  end
end

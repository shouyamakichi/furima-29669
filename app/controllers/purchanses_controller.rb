class PurchansesController < ApplicationController
  before_action :authenticate_user!, except: [:new ]
  
  def index
    @purchanse = Purchanse.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    # @item = Item.find(params[:item_id])
    # @purchanse = @item.purchanses.new(purchanse_params)
    # @purchanse.save
  end


  private
  # def purchanses_params
  #   params.require(:purchanse).merge(user_id: current_user.id, item_id: item.id)
  # end

end

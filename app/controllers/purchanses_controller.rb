class PurchansesController < ApplicationController
  before_action :authenticate_user!, except: [:new ]
  before_action :move_to_index, except: [:index, :show]

  def index
    @purchanse = PurchanseDelivery.new
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @purchanse = UserPurchanse.new
  # end
  
  def create
    @item = Item.find(params[:item_id])
    @purchanse = PurchanseDelivery.new(purchanse_params)
    @purchanse.save
    if @purchanse.valid?
      pay_item
      redirect_to root_path
    else
      render 'index'
    end
  end


  
  def purchanse_params
    params.require(:purchanse_delivery).permit(:zip, :purefecture_id, :city, :reference, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchanse_params[:token],
      currency:'jpy'
    )
  end
  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

class PurchansesController < ApplicationController
  before_action :authenticate_user!, except: [:new ]
  before_action :move_to_index, except: [:index, :show]

  def index
    @purchanse = Purchanse.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchanse = Purchanse.new(purchanse_params)
    if @purchanse.valid?
      pay_item
      @purchanse.save
      return redirect_to root_path
    end
    render :purchanse
  end


  
  def purchanse_params
    params.permit(:token)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Carge.create(
      amount: item_params[:price],
      card: purchanse_params[:token],
      currency:'jpy'
    )
  end
  
  private

  def move_to_index?
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

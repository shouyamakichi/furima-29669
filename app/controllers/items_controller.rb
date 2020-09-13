class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

    def items_params
      params.require(:item).permit(:content, :image, :name, :acount, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price,).merge(user_id: current_user.id)
      # // permitの設定を変える必要があります。受け取りたいキーを全て設定しましょう
    end

end

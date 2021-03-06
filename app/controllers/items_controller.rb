class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

    def items_params
      params.require(:item).permit(:content, :image, :name, :acount, :category_id, :region_id, :state_id, :postage_id,:shipping_date_id, :price,).merge(user_id: current_user.id,)
      # // permitの設定を変える必要があります。受け取りたいキーを全て設定しましょう
    end

    def set_item
      @item = Item.find(params[:id])
    end

end

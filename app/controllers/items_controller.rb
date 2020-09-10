class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    
  end

  # def destroy
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  private

    def items_params
      params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
    end

end

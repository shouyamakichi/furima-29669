class ItemsController < ApplicationController
  #  before_action : move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.create(items_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  # private
  # def move_to_index
  # unless user_sign_in?
  # redirect_to action: :index
  # end
  # end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price, :user)
  end

end

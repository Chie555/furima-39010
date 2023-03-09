class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    # @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price).merge(user_id: current_user.id)
  end
  # def move_to_index
    # @item = Item.find(params[:id])
    # unless user_signed_in? && current_user.id == @item.user_id
      # redirect_to action: :index
    # end
  # end
end

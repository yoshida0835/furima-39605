class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :not_user, only: [:index]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :street, :building, :tel_number).merge(
      item_id: params[:item_id], user_id: current_user.id
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def not_user
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif !@item.order.nil?
      redirect_to root_path
    end
  end
end

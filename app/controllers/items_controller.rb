class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # 記事一覧が新規投稿順に並ぶように記述します。
    # @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end

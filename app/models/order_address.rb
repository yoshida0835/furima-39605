class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :post_code, :prefecture_id, :city, :street, :building, :tel_number, order_id
  with_options presence: true do
    validates :user_id, :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end

def save
  # 購入情報を保存し、変数orderに代入する
  order = Order.create(use_id: user_id, item_id: item_id)
  # 住所を保存する
  # order_idには、変数orderのidと指定する
  Address.create(post_code: post_code, prefecture: prefecture, city: city, street: street, building: building, tel_number: tel_number, order_id: order.id)
end
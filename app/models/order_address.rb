class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :post_code, :prefecture_id,
                :city, :street, :building, :tel_number, :order_id, :price, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :street, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Use only digits without hyphen' }
  end

  def save
    order = Order.create(user_id: use_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building,
                   tel_number: tel_number, order_id: order_id)
  end
end

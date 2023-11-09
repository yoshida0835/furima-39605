class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :name, :post_code, :prefecture_id, :city, :street, :building, :tel_number, :order_id

  with_options presence: true do
    validates :user_id, :item_id, :city, :street
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :tel_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :building

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, city:, street:, building:,
                   tel_number:, order_id: order.id)
  end
end

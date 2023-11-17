class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_many   :likes
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image,  presence: true
  validates :name,   presence: true
  validates :detail, presence: true
  validates :price,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                     format: { with: /\A[0-9]+\z/ }

  validates :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end

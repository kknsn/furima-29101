class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :local, :house_num, :building_name, :tel_num, :order_id, :user_id, :item_id,:token

  #配送先住所に関するバリデーション
  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :tel_num, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :local
    validates :house_num
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, local: local, house_num: house_num, building_name: building_name, tel_num: tel_num, order_id: order.id)
 end
end
class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :address, :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :phone_number, length: { maximum: 11 },
                             format: { with: /\A[0-9]+\z/, message: 'Input only number', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }, allow_blank: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :charge, :prefecture, :shipment
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :description, :category_id, :status_id, :charge_id, :prefecture_id, :shipment_id, :price
  end
  with_options numericality: { other_than: 1, message: 'Select' }, allow_blank: true do
    validates :category_id, :status_id, :charge_id, :prefecture_id, :shipment_id
  end
  with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, allow_blank: true do
    validates :price
  end
end

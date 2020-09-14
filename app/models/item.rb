class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :consignor_area
  belongs_to_active_hash :shipping_costs_burden

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :status_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :delivery_time_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :consignor_area_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :shipping_costs_burden_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :price, numericality: {only_integer: true, greater_than: 299, less_than: 10_000_000}
  end
end

class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

with_options presence: true do
  validates :image
  validates :name
  validates :description
  validates :category, numericality: {other_than: 1, message: "は空欄は受け付けません"}
  validates :status, numericality: {other_than: 1, message: "は空欄は受け付けません"}
  validates :delivery_time, numericality: {other_than: 1, message: "は空欄は受け付けません"}
  validates :consignor_area, numericality: {other_than: 1, message: "は空欄は受け付けません"}
  validates :shipping_costs_burden, numericality: {other_than: 1, message: "は空欄は受け付けません"}
  validates :price, numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
end

end

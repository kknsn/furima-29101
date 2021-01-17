class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :day_id
  end
  validates :name, :description, :price, presence: true
  validates :price, {numericality: { greater_than: 299,less_than: 10000000}, format: { with: /\A[0-9]+\z/ } }
  validates :image, presence: true
end

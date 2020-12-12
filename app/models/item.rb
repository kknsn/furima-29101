class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
  end
  validates :name, :description, :price, presence: true
end

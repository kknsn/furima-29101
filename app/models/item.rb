class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
  end
  validates :name, :description, :price, presence: true
end

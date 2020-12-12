class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :genre_id, numericality: { other_than: 1 } 
  validates :name, :description, :price, presence: true
end

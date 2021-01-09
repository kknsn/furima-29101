class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :tel_num, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :postal_code, :local, :house_num, :tel_num, presence: true
end

class Record < ApplicationRecord
  belongs_to :user
  has_many :categories_records
  has_many :categories, through: :categories_records

  validates :name, presence: true, length: { maximum: 100 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

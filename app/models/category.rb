class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_records
  has_many :records, through: :categories_records
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 100 }
  validates :icon, presence: true, length: { maximum: 250 }

  def most_recent
    records.order(created_at: :DESC)
  end
end

class Category < ApplicationRecord
    belongs_to :user
    has_many :categories_records
    has_many :records, through: :categories_records
    has_one_attached :icon
    before_save { name.downcase! }
  
    validates :name, presence: true, length: { maximum: 100 }
    validates :icon, presence: true, length: { maximum: 250 }
end

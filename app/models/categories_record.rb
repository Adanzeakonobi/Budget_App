class CategoriesRecord < ApplicationRecord
  belongs_to :category
  belongs_to :record
end

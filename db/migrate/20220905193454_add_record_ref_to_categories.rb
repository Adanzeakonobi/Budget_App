class AddRecordRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :record, null: false, foreign_key: true
  end
end

class AddCategoryRefToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :category, null: false, foreign_key: true
  end
end

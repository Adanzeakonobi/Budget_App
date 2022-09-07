class CreateJoinTableCategoriesRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_records do |t|

      t.references :category, null: false, foreign_key: true
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end

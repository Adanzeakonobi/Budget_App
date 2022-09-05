class CreateCategoriesRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_records do |t|

      t.timestamps
    end
  end
end

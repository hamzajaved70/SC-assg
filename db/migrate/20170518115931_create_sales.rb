class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.decimal :total
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

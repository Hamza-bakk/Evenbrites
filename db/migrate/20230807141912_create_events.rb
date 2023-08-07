class CreateEvents < ActiveRecord::Migration[7.0]
    def change
      create_table :events do |t|
        t.datetime :start_date, null: false
        t.integer :duration, null: false
        t.string :title, null: false, limit: 140
        t.text :description, null: false, limit: 1000
        t.integer :price, null: false
        t.string :location, null: false
        t.references :administrator, foreign_key: { to_table: :users }
  
        t.timestamps
      end
      add_index :events, :start_date
  end
end


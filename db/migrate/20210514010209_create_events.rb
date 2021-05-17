class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.integer :tickets_available
      t.string :location
      t.datetime :date
      t.integer :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

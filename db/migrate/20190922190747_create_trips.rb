class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.integer :status,  default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateTripHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_histories do |t|
      t.integer :trip_id
      t.decimal :longitude
      t.decimal :latitude
      t.timestamps
    end
  end
end

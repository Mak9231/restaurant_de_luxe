class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.date :date
      t.time :time
      t.integer :guests

      t.timestamps
    end
  end
end

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :disease, null: false, limit: 50
      t.string :city, null: false, limit: 50
      t.date :appointment_date, null: false
      t.time :appointment_time, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :doctor, null: false, foreign_key: true
      t.timestamps
    end
  end
end

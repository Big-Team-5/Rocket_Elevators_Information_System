class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.string :columnId
      t.string :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.string :date_of_commissioning
      t.string :date_of_last_inspection
      t.string :certificate_of_inspection
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end

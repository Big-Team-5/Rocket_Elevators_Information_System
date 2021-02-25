class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.string :buildingId
      t.string :Type
      t.string :Status
      t.string :EmployeeId
      t.string :date_of_commissioning
      t.string :date_of_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end

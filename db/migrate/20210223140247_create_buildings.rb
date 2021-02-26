class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :full_name_building_administrator
      t.string :email_building_administrator
      t.string :phone_number_building_administrator
      t.string :full_name_technical_contact_for_the_building
      t.string :technical_contact_email_building
      t.string :technical_contact_phone_building

      t.timestamps
    end
  end
end

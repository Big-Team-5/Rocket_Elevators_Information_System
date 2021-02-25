class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :UserId
      t.string :compagny_Name
      t.string :compagny_headquarter_address
      t.string :Full_Name_of_the_compagny_contact
      t.string :compagny_contact_number
      t.string :email_of_the_compagny_contact
      t.string :compagny_description
      t.string :Full_name_of_the_technical_authority
      t.string :technical_authority_phone_for_service
      t.string :technical_manager_email_for_service

      t.timestamps
    end
  end
end

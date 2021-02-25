class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :company_Name
      t.string :company_headquarter_address
      t.string :full_Name_of_the_company_contact
      t.string :company_contact_number
      t.string :email_of_the_company_contact
      t.string :company_description
      t.string :full_name_of_the_technical_authority
      t.string :technical_authority_phone_for_service
      t.string :technical_manager_email_for_service

      t.timestamps
    end
  end
end

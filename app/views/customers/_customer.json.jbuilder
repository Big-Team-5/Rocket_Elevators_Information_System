json.extract! customer, :id, :UserId, :compagny_Name, :compagny_headquarter_address, :Full_Name_of_the_compagny_contact, :compagny_contact_number, :email_of_the_compagny_contact, :compagny_description, :Full_name_of_the_technical_authority, :technical_authority_phone_for_service, :technical_manager_email_for_service, :created_at, :updated_at
json.url customer_url(customer, format: :json)

json.extract! lead, :id, :Full_Name, :Company_Name, :Email, :Phone, :Project_Name, :Project_Description, :Department_In_Charge, :Message, :created_at, :updated_at
json.url lead_url(lead, format: :json)

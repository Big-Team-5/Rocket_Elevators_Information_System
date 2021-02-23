json.extract! battery, :id, :buildingId, :Type, :Status, :EmployeeId, :date_of_commissioning, :date_of_last_inspection, :certificate_of_operations, :information, :notes, :created_at, :updated_at
json.url battery_url(battery, format: :json)

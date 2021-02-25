json.extract! elevator, :id, :columnId, :serial_number, :model, :type, :status, :date_of_commissioning, :date_of_last_inspection, :certificate_of_inspection, :information, :notes, :created_at, :updated_at
json.url elevator_url(elevator, format: :json)

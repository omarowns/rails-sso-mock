json.extract! appointment, :id, :patient_id, :doctor_id, :start_date, :end_date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

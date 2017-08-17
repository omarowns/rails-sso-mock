class Appointment < ApplicationRecord

  belongs_to :patient, class_name: 'User'
  belongs_to :doctor, class_name: 'User'

  default_scope { order('start_date ASC') }

  scope :for_user, ->(user) { where(patient_id: user.id).or(where(doctor_id: user.id)) }
end

class Student < ApplicationRecord
  acts_as_paranoid
  has_many :grades, dependent: :destroy
  has_many :subjects, through: :grades

  after_destroy_commit -> { broadcast_remove_to self }
  after_create_commit lambda {
                        broadcast_after_to 'students', target: 'tr_table', partial: 'components/student',
                                                       locals: { student: self }
                      }
  after_update_commit -> { broadcast_replace_to self, partial: 'components/student', locals: { student: self } }

  scope :by_student_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :by_student_email, ->(email) { where('email ILIKE ?', "%#{email}%") }
  scope :by_student_phone_number, ->(phone_number) { where('phone_number ILIKE ?', "%#{phone_number}%") }

  def average_grade(subject)
    grades.where(subject: subject).average(:value)
  end
end

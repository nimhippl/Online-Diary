class Assignment < ApplicationRecord
  acts_as_paranoid
  belongs_to :subject
  belongs_to :teacher, class_name: 'Users::Teacher'

  validates :subject_id, uniqueness: { scope: :teacher_id }
end

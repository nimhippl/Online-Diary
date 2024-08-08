module Users
  class Teacher < User
    has_many :assignments, dependent: :destroy
    has_many :subjects, through: :assignments

    scope :by_teacher_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
    scope :by_teacher_email, ->(email) { where('email ILIKE ?', "%#{email}%") }
    scope :by_teacher_phone_number, ->(phone_number) { where('phone_number ILIKE ?', "%#{phone_number}%") }

    def teacher?
      true
    end

    def admin?
      false
    end
  end
end

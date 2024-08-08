class Subject < ApplicationRecord
  acts_as_paranoid
  has_many :assignments, dependent: :destroy
  has_many :teachers, through: :assignments

  after_destroy_commit -> { broadcast_remove_to self }
  after_create_commit lambda {
                        broadcast_after_to 'subjects', target: 'tr_table', partial: 'components/subject',
                                                       locals: { subject: self }
                      }
  after_update_commit -> { broadcast_replace_to self, partial: 'components/subject', locals: { subject: self } }

  validates :name, presence: true, uniqueness: true
  scope :by_subject_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
end

module Teacher
  class DashboardController < ApplicationController
    before_action :set_current_table
    before_action :authorize_teacher
    before_action :fetch_subjects, only: [:index]

    has_scope :by_student_name, as: :student_name, only: :index
    has_scope :by_student_email, as: :student_email, only: :index
    has_scope :by_student_phone_number, as: :student_phone, only: :index

    def index
      case @current_table
      when 'teacher_students'
        @students = Student.all
        @students = apply_scopes(@students).page(params[:page]).per(5)
      when 'student_grades'
        @students = Student.all
        fetch_student_grades
      end
    end

    private

    def set_current_table
      @current_table = params[:table] || 'teacher_students'
    end

    def authorize_teacher
      authorize! :access, :teacher_dashboard
    end

    def fetch_student_grades
      @selected_student = Student.find_by(id: params[:student_id]) if params[:student_id].present?
      @selected_subject = Subject.find_by(id: params[:subject_id]) if params[:subject_id].present?
    end

    def fetch_subjects
      @subjects = Subject.all
    end
  end
end

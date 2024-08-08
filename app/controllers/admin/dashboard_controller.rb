module Admin
  class DashboardController < ApplicationController
    before_action :set_current_table
    before_action :authorize_admin

    def index
      case @current_table
      when 'subjects'
        fetch_subjects
      when 'teachers'
        fetch_teachers
      when 'students'
        fetch_students
      end
    end

    private

    def set_current_table
      @current_table = params[:table] || 'subjects'
    end

    def authorize_admin
      authorize! :access, :admin_dashboard
    end

    def fetch_students
      @students = Student.all
      @students = @students.by_student_name(params[:student_name]) if params[:student_name].present?
      @students = @students.by_student_email(params[:student_email]) if params[:student_email].present?
      @students = @students.by_student_phone_number(params[:student_phone]) if params[:student_phone].present?
      @students = @students.page(params[:page]).per(10)
    end

    def fetch_subjects
      @subjects = Subject.all
      @subjects = @subjects.by_subject_name(params[:subject_name]) if params[:subject_name].present?
      @subjects = @subjects.by_teacher_name(params[:teacher_name]) if params[:teacher_name].present?
      @subjects = @subjects.page(params[:page]).per(10)
    end

    def fetch_teachers
      @teachers = Users::Teacher.all
      @teachers = @teachers.by_teacher_name(params[:teacher_name]) if params[:teacher_name].present?
      @teachers = @teachers.by_teacher_email(params[:teacher_email]) if params[:teacher_email].present?
      @teachers = @teachers.by_teacher_phone_number(params[:teacher_phone]) if params[:teacher_phone].present?
      @teachers = @teachers.page(params[:page]).per(10)
    end
  end
end

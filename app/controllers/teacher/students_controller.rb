module Teacher
  class StudentsController < ApplicationController
    has_scope :by_student_name, as: :student_name, only: :index
    has_scope :by_student_email, as: :student_email, only: :index
    has_scope :by_student_phone_number, as: :student_phone, only: :index

    def index
      @students = apply_scopes(Student).page(params[:page]).per(5)
    end
  end
end

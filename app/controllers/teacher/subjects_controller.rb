module Teacher
  class SubjectsController < ApplicationController
    def index
      @subjects = Subject.all
      @grade = Grade.new
      @selected_student = Student.find_by(id: params[:student_id]) if params[:student_id].present?
      @selected_subject = Subject.find_by(id: params[:subject_id]) if params[:subject_id].present?
      load_grades_for_selected_subject if @selected_subject && @selected_student
    end

    private

    def load_grades_for_selected_subject
      @grades = @selected_subject.grades.where(student_id: @selected_student.id)
                                 .order(:date)
                                 .page(params[:page])
                                 .per(10)
    end
  end
end

module Teacher
  class GradesController < ApplicationController
    before_action :load_grades_for_selected_subject, only: [:index]

    def index
      @grade = Grade.new
    end

    def create
      @grade = Grade.new(grade_params)
      if @grade.save
        redirect_to teacher_dashboard_path(table: 'student_grades')
      else
        render :index
      end
    end

    private

    def load_grades_for_selected_subject
      @selected_subject = Subject.find_by(id: params[:grade][:subject_id])
      @selected_student = Student.find_by(id: params[:grade][:student_id])
      return unless @selected_subject && @selected_student

      @grades = @selected_subject.grades.where(student_id: @selected_student.id)
                                 .order(:date)
                                 .page(params[:page])
                                 .per(10)
    end

    def grade_params
      params.require(:grade).permit(:student_id, :subject_id, :date, :value)
    end

    def set_selected_subject_session
      session[:selected_subject_id] = @grade.subject_id
    end
  end
end

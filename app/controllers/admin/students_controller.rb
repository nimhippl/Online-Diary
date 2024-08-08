module Admin
  class StudentsController < ApplicationController
    has_scope :by_student_name, as: :student_name, only: :index
    has_scope :by_student_email, as: :student_email, only: :index
    has_scope :by_student_phone_number, as: :student_phone, only: :index

    def index
      @students = apply_scopes(Student).page(params[:page]).per(5)
    end

    def new
      @student = Student.new
    end

    def edit
      @student = Student.find(params[:id])
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        redirect_to admin_dashboard_path(table: 'students')
      else
        render :new
      end
    end

    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
        redirect_to admin_dashboard_path(table: 'students')
      else
        render :edit
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.destroy(@subject) }
        format.html { redirect_to admin_dashboard_path(table: 'students') }
      end
    end

    private

    def student_params
      params.require(:student).permit(:name, :email, :phone_number)
    end
  end
end

module Admin
  class SubjectsController < ApplicationController
    has_scope :by_subject_name, as: :subject_name, only: :index
    has_scope :by_teacher_name, as: :teacher_name, only: :index

    def index
      @subjects = apply_scopes(Subject).page(params[:page]).per(5)
    end

    def new
      @subject = Subject.new
      @teachers = Users::Teacher.all
    end

    def edit
      @subject = Subject.find(params[:id])
      @teachers = Users::Teacher.all
    end

    def create
      @subject = Subject.new(subject_params)
      @teachers = Users::Teacher.all

      if @subject.save
        redirect_to admin_dashboard_path(table: 'subjects')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @subject = Subject.find(params[:id])
      @teachers = Users::Teacher.all

      if @subject.update(subject_params)
        redirect_to admin_dashboard_path(table: 'subjects')
      else
        render :edit
      end
    end

    def destroy
      @subject = Subject.find(params[:id])
      @subject.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.destroy(@subject) }
        format.html { redirect_to admin_dashboard_path(table: 'subjects') }
      end
    end

    private

    def subject_params
      params.require(:subject).permit(:name, teacher_ids: [])
    end
  end
end

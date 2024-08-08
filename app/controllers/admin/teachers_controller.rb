module Admin
  class TeachersController < ApplicationController
    has_scope :by_teacher_name, as: :teacher_name, only: :index
    has_scope :by_teacher_email, as: :teacher_email, only: :index
    has_scope :by_teacher_phone_number, as: :teacher_phone, only: :index

    def index
      @teachers = apply_scopes(Users::Teacher).page(params[:page]).per(5)
    end

    private

    def teacher_params
      params.require(:users_teacher).permit(:name, :email)
    end
  end
end

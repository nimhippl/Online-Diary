class HomeController < ApplicationController
  def index
    @current_user = current_user
    case current_user
    when Users::Admin
      redirect_to admin_dashboard_path
    when Users::Teacher
      redirect_to teacher_dashboard_path
    end
  end
end

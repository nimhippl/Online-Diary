class ApplicationController < ActionController::Base
  before_action :set_locale
  # before_action :authenticate_user!
  #

  protected

  def set_locale
    I18n.locale = :ru
  end

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.type == 'Users::Admin'
      admin_dashboard_path
    elsif resource.is_a?(User) && resource.type == 'Users::Teacher'
      teacher_dashboard_path
    else
      super
    end
  end
end

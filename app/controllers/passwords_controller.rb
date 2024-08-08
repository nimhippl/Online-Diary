module Users
  class PasswordsController < Devise::PasswordsController
    before_action :ensure_not_authenticated, only: %i[edit update]

    def edit
      Rails.logger.debug { "Токен для сброса пароля (edit): #{params[:reset_password_token]}" }

      if params[:reset_password_token].blank?
        redirect_to new_session_path(resource_name)
      else
        super
      end
    end

    def update
      Rails.logger.debug { "Токен для сброса пароля (update): #{params[:user][:reset_password_token]}" }

      if params[:user][:reset_password_token].blank?
        self.resource = resource_class.new
        resource.errors.add(:reset_password_token, :blank)
        render :edit
      else
        super
      end
    end

    private

    def resource_params
      params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
    end

    def ensure_not_authenticated
      return unless user_signed_in?

      redirect_to root_path
    end
  end
end

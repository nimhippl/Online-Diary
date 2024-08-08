module Users
  class PasswordsController < Devise::PasswordsController
    def update
      self.resource = resource_class.reset_password_by_token(resource_params)
      yield resource if block_given?

      if resource.errors.empty?
        resource.unlock_access! if unlockable?(resource)
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message(:notice, flash_message) if is_flashing_format?
        sign_in(resource_name, resource)
        respond_with resource, location: after_resetting_password_path_for(resource)
      else
        respond_with resource
      end
      logger.debug "Errors: #{resource.errors.full_messages}"
    end

    protected

    def after_resetting_password_path_for(resource)
      after_sign_in_path_for(resource)
    end

    def reset_password_params
      params.require(:user).permit(:password, :password_confirmation, :reset_password_token)
    end
  end
end

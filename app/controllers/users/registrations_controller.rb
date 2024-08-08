module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def create
      super do |resource|
        if resource.persisted?
          resource.send_confirmation_instructions
          set_flash_message! :notice, :signed_up_but_unconfirmed
          redirect_to letter_opener_web_path and return
        end
      end
    end

    private

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name phone_number type])
    end
  end
end

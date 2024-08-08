module Users
  class Mailer < Devise::Mailer
    helper :application
    include Devise::Controllers::UrlHelpers
    default template_path: 'users/mailer'

    def reset_password_instructions(record, token, opts = {})
      reset_password_url = edit_user_password_url(reset_password_token: token, host: 'localhost', port: 3000)

      opts[:reset_password_url] = reset_password_url
      Rails.logger.debug do
        "Отправка письма для сброса пароля пользователю #{record.email} с токеном #{token} и URL #{reset_password_url}"
      end
      super
    end
  end
end

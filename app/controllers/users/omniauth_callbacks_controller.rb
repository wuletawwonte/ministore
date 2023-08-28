# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def azure_activedirectory_v2
      data = request.env['omniauth.auth']['info']
      @user = User.where(email: data['email']).first
      @user ||= User.create(
        first_name: data['first_name'],
        last_name: data['last_name'],
        email: data['email'],
        password: Devise.friendly_token[0, 20],
        provider: request.env['omniauth.auth']['provider'],
        uid: request.env['omniauth.auth']['uid']
      )

      if @user.persisted?
        flash[:notice] = "Welcome #{@user.first_name}!"
        sign_in_and_redirect @user, event: :authentication
      else
        flash[:alert] = I18n.t 'Authentication failed, please try again.'
        redirect_to new_user_registration_url, notice: @user.errors.full_messages.join("\n")
      end
    end

    def failure
      redirect_to root_path, alert: 'Authentication failed, please try again.'
    end
  end
end

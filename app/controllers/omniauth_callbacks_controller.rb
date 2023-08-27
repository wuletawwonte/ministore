# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def microsoft_office365
    callback_from :microsoft_office365
  end

  def failure
    redirect_to after_omniauth_failure_path_for(resource_name)
  end

  private

  def callback_from(_provider)
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in through Office 365. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end
end

class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    omniauth_sign_in :facebook
  end


  def google_oauth2
    omniauth_sign_in :google
  end

  def github
    omniauth_sign_in :github
  end

  private

  def omniauth_sign_in(authorizer = nil)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: authorizer.to_s.capitalize) if is_navigational_format?
    else
      redirect_to new_user_registration_url
    end
  end

end
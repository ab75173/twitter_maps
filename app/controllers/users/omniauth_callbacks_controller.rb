class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter

    cookies.delete(:long)
    cookies.delete(:lat)
    cookies.delete(:zip)

    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"].provider, request.env["omniauth.auth"].uid, request.env["omniauth.auth"].extra.raw_info.name, request.env["omniauth.auth"].info.email, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].uid
      redirect_to root_path
    end
  end

end

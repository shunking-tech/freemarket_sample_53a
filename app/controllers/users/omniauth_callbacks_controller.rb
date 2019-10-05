class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    set_user_and_sns_id
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session[:sns_id] = @sns_id
      render template: "users/registrations/new"
    end
  end

  def failure
    redirect_to root_path and return
  end

  private

  def set_user_and_sns_id
    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    @sns_id = info[:sns_id]
  end
end

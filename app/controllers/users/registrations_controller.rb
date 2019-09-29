# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    if session[:sns_id]
      set_password
      super
      update_sns_credential
    else
      super
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  def top
    redirect_to root_url if user_signed_in?
  end

  def sms_confirmation
    @user = User.new
  end

  def deliver_address
    # 現在、deliver_addressのテーブルがないためuserで代理
    # Todo UserをDeliverAddressに変更
    @deliver_address = User.new
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    change_to_kana
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:nickname,
             :email,
             :password,
             :password_confirmation,
             :first_name,
             :first_name_kana,
             :last_name,
             :last_name_kana,
             :birth_date])
  end

  private

  def change_to_kana
    first_name_kana = params[:user][:first_name_kana]
    last_name_kana = params[:user][:last_name_kana]
    params[:user][:first_name_kana] = first_name_kana.tr('ぁ-ん','ァ-ン')
    params[:user][:last_name_kana] = last_name_kana.tr('ぁ-ん','ァ-ン')
  end

  def set_password
    password = Devise.friendly_token.first(16)
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
  end

  def update_sns_credential
    sns = SnsCredential.find(session[:sns_id])
    sns.update(user_id:  @user.id)
    session[:sns_id] = nil
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

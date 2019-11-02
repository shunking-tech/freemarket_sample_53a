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
    if session[:sns]
      set_password
      super
      create_sns_credential
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

  def sms_authorization
    @user = User.new
  end

  def deliver_address
    @deliver_address = DeliverAddress.new
  end

  def deliver_address_create
    # 本当はdeliver_addressのコントローラでやりたいが、現状は仕方なく
    @deliver_address = DeliverAddress.new(deliver_address_params)
    if @deliver_address.save
      redirect_to action: "credit_card"
    else
      render :deliver_address
    end
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
    password = Devise.friendly_token.first(14)
    password.insert(rand(14), rand(9).to_s).insert(rand(15), ("A".."Z").to_a[rand(26)])
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
  end

  def create_sns_credential
    sns = session[:sns]
    session[:sns] = nil
    sns[:user_id] = @user.id
    SnsCredential.create(sns)
  end

  def deliver_address_params
    params.require(:deliver_address).permit(
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :zipcode,
      :prefecture_id,
      :city,
      :house_address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
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

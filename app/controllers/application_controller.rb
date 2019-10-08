class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production_or_staging?

  private

  def production_or_staging?
    Rails.env.production? || Rails.env.staging?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:user]
      password == Rails.application.credentials.basic[:password]
    end
  end
end


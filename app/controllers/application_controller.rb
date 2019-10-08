class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production? || :staging?

  private

  def production?
    Rails.env.production?
  end

  def staging?
    Rails.env.staging?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:user]
      password == Rails.application.credentials.basic[:password]
    end
  end
end


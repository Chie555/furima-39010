class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'ea11a0f2609e4cfa3e05e2071187d60b'
    end
  end

end

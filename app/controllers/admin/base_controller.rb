class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_basic 'Podaj hasło' do |name, password|
      name == 'admin' && password == 'admin'
    end
  end
end

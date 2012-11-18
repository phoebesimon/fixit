class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :prepare_session

  def prepare_session
    if session[:expiry_time] and session[:expiry_time] < Time.now
      session[:expiry_time] = nil
      redirect_to logout_path
    end
    session[:expiry_time] = Time.now + 30.minutes
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end

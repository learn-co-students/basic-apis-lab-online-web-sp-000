class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


private
# checking hte authentication of the user
  def authenticate_user
    client_id = ENC['FOURSQUARE_CLIENT_ID']
    # id gotten specific to the user (if a user can log-in that means they should have thier own uniq token)
    redirect_uri = CGI.escape("http://localhost:3000/auth")
    foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    redirect_to foursquare_url unless logged_in?

  end

  def logged_in?
    !!session[:token]
  end
end

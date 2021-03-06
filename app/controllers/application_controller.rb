class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter  :verify_authenticity_token

  before_filter :intercept_html_requests

  layout nil

  private

  def intercept_html_requests
    render('layouts/dynamic') if (request.format == Mime::HTML and user_signed_in?)
  end

  def handle_unverified_request
    reset_session
    render "#{Rails.root}/public/500.html", :status => 500, :layout => nil
  end

end

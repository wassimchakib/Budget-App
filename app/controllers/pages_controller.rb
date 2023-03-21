class PagesController < ApplicationController
  def splash
    redirect_to dashboard_path if user_signed_in?
  end
end

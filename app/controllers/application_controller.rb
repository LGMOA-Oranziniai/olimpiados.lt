class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_site_locale
  
  def set_site_locale
    I18n.locale = :lt
  end

  def set_admin_locale
    I18n.locale = :en
  end
end

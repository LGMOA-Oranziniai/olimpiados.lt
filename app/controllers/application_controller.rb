class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_site_locale
  
  def set_site_locale
    I18n.locale = (self.class <= ActiveAdmin::BaseController) ? :en : :lt
  end

  def set_admin_locale
    I18n.locale = (self.class <= ActiveAdmin::BaseController) ? :en : :lt
  end
end

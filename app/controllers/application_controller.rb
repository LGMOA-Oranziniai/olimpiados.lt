class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_site_locale
  
  def set_site_locale
    I18n.locale = (self.class <= ActiveAdmin::BaseController) ? :en : :lt
    @footer_article = Article.footer_article
  end

  def set_admin_locale
    I18n.locale = (self.class <= ActiveAdmin::BaseController) ? :en : :lt
  end
end

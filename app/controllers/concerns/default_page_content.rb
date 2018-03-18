module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'Devcamp | Home'
    @seo_keywords = 'Jose Ramirez portfolio Devcamp'
  end
end
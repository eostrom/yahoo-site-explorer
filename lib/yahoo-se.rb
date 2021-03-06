module Yahoo
  API_DOMAIN = "http://search.yahooapis.com"
  
  module SE
    VERSION = "V1"
    SERVICE_PATH = "#{API_DOMAIN}/SiteExplorerService/#{VERSION}"
    
    class << self
      attr_accessor :application_id
    end
  end
end


%w(exceptions paginator inlinks pages request response result version ping update_notification).each do |file|
  require File.join(File.dirname(__FILE__), "yahoo-se", file)
end
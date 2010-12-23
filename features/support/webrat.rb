module Webrat
  class Session
    def current_host
      URI.parse(current_url).host || @custom_headers["Host"] || default_current_host
    end
    
    def default_current_host
      adapter.class==Webrat::RackAdapter ? "example.org" : "www.example.com"
    end
  end
end
module Iphone
  # stripped down and adapted from http://github.com/rrodrigu3z/rails_jqtouch
  # simple usage: 
  #   class ApplicationController < ActionController::Base
  #     acts_as_iphone_controller
  #     ...
  #   end
  #
  # you can use this in other controllers as well.
  # I'm using Clearance in filo, which doesn't play very well (as of current version) with custom defined format;
  # hence the commented out code in set_iphone_format and acts_as_iphone_controller
  
  module IphoneController
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
    
      def acts_as_iphone_controller
        include IphoneController::InstanceMethods 
        before_filter(:set_iphone_format)
        helper_method :is_iphone_request?
      end
    end
    
    module InstanceMethods
      private
      
      # Commenting this out as I can't make it work nicely with Clearance
      def set_iphone_format
        if is_iphone_request? || is_iphone_format? || is_iphone_subdomain?
          request.format = cookies["browser"] == "desktop" ? :html : :iphone 
        end
      end
      
      def is_iphone_format?
        request.format.to_sym == :iphone
      end
      
      def is_iphone_request?
        request.user_agent =~ /(Mobile\/.+Safari)/
      end
      
      def is_iphone_subdomain?
        request.subdomains.first == "iphone"
      end
    end #InstanceMethods
  end #IphoneController
end #ActionController
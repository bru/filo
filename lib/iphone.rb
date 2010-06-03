require 'iphone/iphone_controller'
ActionController::Base.send(:include, Iphone::IphoneController)
# Mime Type iphone como alias de text/html
Mime::Type.register_alias "text/html", :iphone
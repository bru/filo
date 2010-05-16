# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def beautify_title
     "#{ params[:controller]} : #{ params[:action]} "
   end 
   
   def flash_messages
     out="<div id=\"flash\">"
     flash.each do |key, value|
       out += "<div id=\"flash_#{key}\">#{h value}</div>"
     end
     out+="</div>"
   end
end

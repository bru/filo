# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
   def beautify_title
     "#{ params[:controller]} : #{ params[:action]} "
   end 
end

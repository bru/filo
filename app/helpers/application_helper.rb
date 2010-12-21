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
    return out.html_safe
  end
  
   def bookmarklet
    # Work in progress: 
    # "javascript:var%20b=document.body;if(b&&!document.xmlVersion){void(z=document.createElement('script'));void(z.src='http://#{FILO_HOST}/javascripts/filo-it.js');void(b.appendChild(z));}else{}"
    "javascript:window.open('http://#{FILO_HOST}/a?s='+
    encodeURIComponent(''+(window.getSelection?window.getSelection():document.getSelection?document.getSelection():document.selection.createRange().text)).replace(/ /g,'+')+
    '&u='+encodeURIComponent(document.location.href)+'&t='+encodeURIComponent(document.title)+'','Filo-ing...','toolbar=0,resizable=0,status=1,width=400,height=120');void(0)"
   end
   
   def show_visitor_links?
     ![new_user_session_path, new_user_registration_path].include? request.path
   end
end

##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TeveoLive-Video-Broadcast-Software" do
author "Brendan Coles <bcoles@gmail.com>" # 2015-05-05
version "0.1"
description "TeveoLive webcam - Homepage [offline]: http://www.teveo.com/"

# Default Port: 8080

# Matches #
matches [

# Tag Pattern
#{:name=>'HTML Tag Pattern', :tagpattern=>'html,head,title,/title,meta,/head,center,body,a,img,/a,table,tr,td,applet,param,param,param,param,/applet,/td,/tr,/table,font,a,/a,/font,/body,/center,/html'},

# MD5
#{:name=>'MD5 hash', :md5=>'6649fb3177d4c106d3f3307872763892'}

# Logo Image
#{ :text=>'<img src="images/vidioscene.jpg" border=0 width="61" height="30"></a> '},

# HTTP Server Header
{ :search=>"headers[server]", :regexp=>/^TeveoLive HTTP Server$/ },

# xVideoWidth Header
{ :search=>"headers[xvideowidth]", :regexp=>/^\d+$/},

# xVideoHeight Header
{ :search=>"headers[xvideoheight]", :regexp=>/^\d+$/},

]

end


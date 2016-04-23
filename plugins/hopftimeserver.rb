##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-07-30 # Brendan Coles <bcoles@gmail.com>
# Added examples URLs, cookie match and google dork
# Updated matches and version detection
##
Plugin.define "HopfTimeServer" do
author "Aung Khant, http://yehg.net"
version "0.2"
description "Detect Hopf Time Server CGI application (http://www.hopf.com/)"

# Google results as at 2011-07-30 #
# 8 for inurl:/cgi-bin/main.cgi?ntp

			

# Dorks #
dorks [
'inurl:/cgi-bin/main.cgi?ntp'
]

# Matches #
matches [

# Tag Pattern # /cgi-bin/main.cgi?ntp&0
{:url=>'/cgi-bin/main.cgi?ntp&0', :name=>'HTML Tag Pattern', :tagpattern=>'html,head,link,link,title,/title,style,/style,script,/script,meta,/head,body,table,tr,td,img,map,area,area,/map,/td,td,img,/td,/tr,tr,td,/td,td,/td,td,table,tr,td,img,/td,td,img,/td,td,a,/a,/td,td,img,/td,td,a,/a,/td,td,img,/td,td,a,/a,/td,td,img,/td,td,a,/a,/td,td,img,/td,td,a,/a,/td,td,img,/td,td,/td,td,table,tr,td,img,/td,td,img,/td,td,img,/td,td,img,/td,td,img,/td,/tr,/table,/td,td,img,/td,/tr,/table,/td,td,img,/td,/tr,tr,td,img,/td,td,/td,td,table,tr,td,table,tr,td,table,tr,td,table,tr,td,img,/td,td,div,/div,/td,td,img,/td,/tr,/table,/td,/tr,tr,td,table,tr,td,img,/td,td,/td,td,img,/td,/tr,tr,td,/td,td,div,table,tr,td,iframe,/iframe,/td,/tr,/table,/div,/td,td,/td,/tr,tr,td,img,/td,td,/td,td,img,/td,/tr,/table,/td,/tr,/table,/td,td,div,/div,/td,td,table,tr,td,table,tr,td,img,/td,td,div,/div,/td,td,img,/td,/tr,/table,/td,/tr,tr,td,table,tr,td,img,/td,td,/td,td,img,/td,/tr,tr,td,/td,td,div,table,tr,td,iframe,/iframe,/td,/tr,/table,/div,/td,td,/td,/tr,tr,td,img,/td,td,/td,td,img,/td,/tr,/table,/td,/tr,/table,/td,/tr,tr,td,table,tr,td,table,tr,td,img,/td,td,div,/div,/td,td,img,/td,/tr,/table,/td,/tr,tr,td,table,tr,td,img,/td,td,/td,td,img,/td,/tr,tr,td,/td,td,div,table,tr,td,form,table,tr,td,/td,/tr,tr,td,input,/td,/tr,tr,td,/td,/tr,tr,td,input,/td,/tr,tr,td,input,/td,/tr,tr,td,br,br,/td,/tr,/table,/form,/td,/tr,/table,/div,/td,td,/td,/tr,tr,td,img,/td,td,/td,td,img,/td,/tr,/table,/td,/tr,/table,/td,/tr,/table,/td,td,/td,/tr,/table,/td,td,img,/td,/tr,tr,td,/td,td,/td,td,div,/div,/td,td,img,/td,/tr,tr,td,/td,td,/td,td,/td,td,/td,/tr,/table,/body,/html'},

# Aggressive # Version Detection # /cgi-bin/main.cgi?ntp&0
{ :url=>'/cgi-bin/main.cgi?ntp&0', :version=>/><title>Hopf ([^<]+) - System Info<\/title/ },

# Version Detection # Title
{ :version=>/><title>Hopf ([^<^\s]+) - (System Info|General|Peers|Server Configuration|Kernel Info)<\/title>/ },

# Version Detection # Title # Redirect Page
{ :version=>/<head><title>HOPF ([^<^\s]+) Configuration<\/title>/ },

]

# Passive #
def passive
	m=[]

	# NCD_COOKIE Cookie
	m << { :name=>"NCD_COOKIE Cookie" } if @headers["set-cookie"] =~ /NCD_COOKIE=language=0#username=#logintime=#lastaction=;/

	# Return passive matches
	m
end
end


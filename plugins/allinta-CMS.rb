##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Allinta-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-15
version "0.1"
description "Allinta - easy to use ASP CMS (Content Management System) - professional features & superior value. - homepage: http://www.allinta.com/"

# 31 results for "powered by allinta CMS" @ 2010-08-15
examples %w|
www.allinta.com
demo.allinta.com
demo.allinta.com/demoadmin/
www.mobilease.com/cmsadmin/
www.salcuratorealty.com/cmsadmin/
www.adathisraelnj.org
63.134.233.104
www.rain-it.dk
www.lyskeglen.dk
www.giwct.org.au
www.sutherlandhs.co.za/cms/
www.urbangrocery.com/vegrocery/
www.dorothy-springer-trust.org.uk
www.greerauction.com
www.mywoodhandcross.com
|

matches [

{ :regexp=>/	<link rel="stylesheet" href="css\/wizard\/t[0-9_]+.css" type="text\/css">/ },

{ :regexp=>/	<link href="css\/wizard\/t[0-9_]+.css" rel="stylesheet" type="text\/css">/ },

{ :text=>'		<td align="right" class="footerText">Powered by allinta CMS</td>' },

{ :regexp=>/	<link rel="stylesheet" href="css\/wizard\/t[0-9_]+.css" type="text\/css">/ },

{ :regexp=>/<a[\ target="_blank"]* href="http:\/\/www.allinta.com[\/buy\/default\.asp\?ac=]*[0-9]*"[\ target="blank"]*>/ },

{ :regexp=>/<img src="img\/wizard\/t[0-9_]+\/powered_allinta.gif" [^alt]+alt="Powered by Allinta CMS"/ },

{ :regexp=>/<img contenteditable="inherit" start="fileopen" height="[0-9]+" src="img\/powered_allinta.gif" width="[0-9]+" \/>/ },

# Admin page
{ :text=>'<title>allinta.com- aCMS Content Manager</title>' },

]

# Version detection using HTML comment on the admin login page
def passive
        m=[]

        if @body =~ /<!-- allintaCMS V[\d\.]+ - http:\/\/www.allinta.com\/ -->/
                version=@body.scan(/<!-- allintaCMS V([\d\.]+) - http:\/\/www.allinta.com\/ -->/)[0][0]
                m << {:version=>version}
        end

        m

end


end


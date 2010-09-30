##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OvBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-26
version "0.1"
description "Written in PHP and powered by MySQL, OvBB is a light-weight and fast discussion board system that mimics vBulletin 2 in both look and behavior while incorporating new features and functionality. - homepage: http://sourceforge.net/projects/ovbb/"

# 34 results for "powered by OvBB" @ 2010-09-26
examples %w|
aftertragedy.us/ovbb/
community.namforum.com
averonstudio.zoomcities.com/forums/
ciprodiscussion.com/forum/
azulblues.com/message/upload/
wyh.me
www.auditdatabase.com/Forum/
www.theenglishlab.net/forum/
www.rv-ideas.com
www.divineideas.org/message/upload/
www.aggressiveprostatecancer.com/blog/forum/
|

matches [

# Default title
{ :regexp=>/<title>[^::]+:: Powered by OvBB<\/title>/ },

# Default logo HTML
{ :regexp=>/<img src="images\/ovbb.png" align="middle" border="0" alt="[^::]+:: Powered by OvBB" \/><\/a>/ },

# Default favicon
{ :md5=>"8dd1c74458a43d658a9136333893a999", :url=>"/favicon.ico" },

# Database error page
{ :text=>'<p>Please try again by pressing the <a href="javascript:window.location=window.location;">refresh</a> button in your browser. An e-mail message has been dispatched to the <a href="mailto:' },

]

# Passive version detection
def passive
        m=[]

        if @body =~ /<a style="color: #EEEEFF;" href="http:\/\/www.ovbb.org">Powered by OvBB V([0-9a-z]+)<\/a><br \/><br \/>/
                version=@body.scan(/<a style="color: #EEEEFF;" href="http:\/\/www.ovbb.org">Powered by OvBB V([0-9a-z]+)<\/a><br \/><br \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


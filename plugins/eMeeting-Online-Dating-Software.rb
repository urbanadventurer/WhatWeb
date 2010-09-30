##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eMeeting-Online-Dating-Software" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "Dating Software by eMeeting Ltd - homepage: http://www.datingscripts.org/"

# 53 results for "eMeeting Dating Software Version" @ 2010-08-30
examples %w|
datingscripts.co.uk/dating-software-demo/
datingscripts.ws/newadmin/
datingscripts.ws/index.php
|

matches [

# Admin page
{ :text=>'<html xmlns="http://www.w3.org/1999/xhtml"><head><title>Admin Area Login</title>' },
{ :text=>'				<td valign="bottom"><h2>Admin Area Login</h2></td>' },

# Powered by text
{ :text=>'<a href="http://www.datingscripts.org" alt="Dating Software by eMeeting Ltd" target="_blank">Dating Software Powered by eMeeting Ltd</a>' },

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /<p>eMeeting Dating Software <strong>Version ([\d\.]+)<\/strong>/
                version=@body.scan(/<p>eMeeting Dating Software <strong>Version ([\d\.]+)<\/strong>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


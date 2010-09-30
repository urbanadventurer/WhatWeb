##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pro-Chat-Rooms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "An Ideal Solution For Web Conferencing, Dating and all Online Communities. - homepage: http://www.prochatrooms.com/"

# 4 results for "Pro Chat Rooms" "Please enter your login details below." "Select Room" @ 2010-08-30
examples %w|
textchat.prochatrooms.com
videochat.prochatrooms.com
www.chat.gofreeserve.com
|

matches [

# Login page
{ :text=>'<title>Pro Chat Rooms</title>' },
{ :text=>'<tr id="doPasswordBox"><td>Password:</td><td><input type="password" name="password" id="password" value="" onblur="def(\'password\')" class="uInput"/></td></tr>' },
{ :text=>'	showError("char_error", "Sorry, Username is already registered.");' },
{ :text=>"var loginNameErrorChr = 'Your username has special characters.<br>These characters are not allowed,<br>!@#$\%SPC^&*()+=-[]\&#39;;,./{}|&#34:<>?.<br>Please remove them and try again.';" },

]

# Version detection using logo alt text
def passive
        m=[]

        if @body =~ /<img src="images\/chat.gif" border="0" alt="Pro Chat Rooms v([\d\.]+)" title="Pro Chat Rooms v([\d\.]+)" \/>/
                version=@body.scan(/<img src="images\/chat.gif" border="0" alt="Pro Chat Rooms v([\d\.]+)" title="Pro Chat Rooms v([\d\.]+)" \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


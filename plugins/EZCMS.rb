##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EZCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.1"
description "Building your own website is easy with the EZ Websites Builder - homepage: http://www.ezwebsites.com.au"

# 20 results for "powered by EZCMS" -Vulnerabilities @ 2010-08-28
examples %w|
ezcms.eztechhelp.com
www.eztechhelp.com/ezcms/
ezcms.eztechhelp.com
www.liverpoolwebdesign.com.au
www.ezwebsites.com.au
|

matches [

# Powered by text
{ :text=>'        <td align="right"><a href="http://www.ezwebsites.com.au" class="credits">Site Powered by EZCMS</a></td>' },

# Admin page html
{ :text=>'      <td width="100%" align="left" valign="bottom" background="images/headerbg.png"><div align="right"><img src="images/headerright.png" border="0"></div></td>' },

# Admin logo
{ :md5=>'3f9861ab3124420694f663c82bf770ab', :url=>'admin/images/headerright.png' },

# Default title
{ :text=>'<title>EZCMS Content Management System</title>' },

]

# Version detection
def passive
        m=[]

	# Admin page
        if @body =~ /<center><strong>EZCMS ([\d\.]+) /
                version=@body.scan(/<center><strong>EZCMS ([\d\.]+) /)
                m << {:version=>version}
        end

	# Powered by text
	if @body =~ /Powered by <a href="http:\/\/ezcms.eztechhelp.com\/">EZCMS ([\d\.]+)<\/a>/
		version=@body.scan(/Powered by <a href="http:\/\/ezcms.eztechhelp.com\/">EZCMS ([\d\.]+)<\/a>/)[0][0]
		 m << {:version=>version}
	end

        m

end


end


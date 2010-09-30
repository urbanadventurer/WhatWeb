##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kayako-SupportSuite" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-24
version "0.1"
description "We offer all of our helpdesk solutions as licensed products (install and host it yourself) or as help desk hosting services. - homepage: http://www.kayako.com/"

# 314 results for "powered by Kayako eSupport" @ 2010-09-24
examples %w|
demo.kayako.com/supportsuite/
demo.kayako.com/supportsuite/admin/
demo.kayako.com/supportsuite/staff/
www.developershed.com/esupport/
www.customerhelpdesk.org/
www.customerhelpdesk.org/admin/
www.developershed.com/esupport/admin/
|

matches [

# Default title
{ :text=>' - Powered By Kayako eSupport</title>' },

# Login page # Powered by text
{ :regexp=>/<span class="smalltext"><font color="#333333">Powered by [eSupport|SupportSuite]+<br\/>Copyright &copy; 2001-[0-9]{4} Kayako Infotech Ltd.<\/font><\/span><br \/>/ },

]

# Version detection
def passive
	m=[]

	if @body =~ /<a href="http:\/\/www.kayako.com" target="_blank">Help Desk Software By Kayako eSupport v([\d\.]+)<\/a>/
		version=@body.scan(/<a href="http:\/\/www.kayako.com" target="_blank">Help Desk Software By Kayako eSupport v([\d\.]+)<\/a>/)[0][0]
		m << {:version=>version}
	end

	if @body =~/<a href="http:\/\/www.kayako.com" target="_blank" title="Help Desk Software">Help Desk Software<\/a>&nbsp;by Kayako SupportSuite v([\d\.]+)/
		version=@body.scan(/<a href="http:\/\/www.kayako.com" target="_blank" title="Help Desk Software">Help Desk Software<\/a>&nbsp;by Kayako SupportSuite v([\d\.]+)/)[0][0]
		 m << {:version=>version}
	end

	if @body =~ /<td width="144" align="left" valign="top"><span class="smalltext"><font color="#333333">([\d\.]+)<\/font><\/span><\/td>/
		version=@body.scan(/<td width="144" align="left" valign="top"><span class="smalltext"><font color="#333333">([\d\.]+)<\/font><\/span><\/td>/)[0][0]
		m << {:version=>version}
	end

	m

end

end


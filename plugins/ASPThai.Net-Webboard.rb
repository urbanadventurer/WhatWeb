##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ASPThai.Net-Webboard" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "ASPThai.Net Webboard - homepage: http://www.aspthai.net/"

# 5 results for "powered by ASPThai.Net Webboard version" @ 2010-08-30
examples %w|
www.correct.go.th/tdclamp/Webboard/default.asp
users.domaindlx.com/mcgar/webboard/
www.champa.kku.ac.th/qa/webboard/default.asp
203.155.220.217/law/webboard/default.asp
|

matches [

# meta copyright text
{ :text=>'<meta name="copyright" content="Copyright (C) 2002-2005 Supap Wanawan" />' },

]

# Version detection
def passive
        m=[]

	# Powered by text
        if @body =~ /  <br \/><br \/><span class="text" style="font-size:10px">Powered by <a href="http:\/\/www.aspthai.net\/" target="_blank" style="font-size:10px">ASPThai.Net Webboard<\/a> version ([\d\.]+)<\/span><br \/><span class="text" style="font-size:10px">Copyright &copy;2002-2005 <a href="http:\/\/www.aspthai.net\/" target="_blank" style="font-size:10px">ASPThai.Net<\/a><\/span>/
                version=@body.scan(/  <br \/><br \/><span class="text" style="font-size:10px">Powered by <a href="http:\/\/www.aspthai.net\/" target="_blank" style="font-size:10px">ASPThai.Net Webboard<\/a> version ([\d\.]+)<\/span><br \/><span class="text" style="font-size:10px">Copyright &copy;2002-2005 <a href="http:\/\/www.aspthai.net\/" target="_blank" style="font-size:10px">ASPThai.Net<\/a><\/span>/)[0][0]
                m << {:version=>version}
        end

	# HTML comment
	if @body =~ /<!-- ASPThai.Net Webboard ver. ([\d\.]+) is written and produced by Supap Wanawan/
		version=@body.scan(/<!-- ASPThai.Net Webboard ver. ([\d\.]+) is written and produced by Supap Wanawan/)[0][0]
		m << {:version=>version}
	end

        m

end


end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpwcms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description " is a robust and simple but yet powerful web based content management system running under PHP and MySQL."
website "http://www.phpwcms.de/"

# 244 results for "template powered by phpWCMS-templates.de" @ 2010-09-03


matches [

# HTML comment
{ :text=>'	phpwcms is copyright 2003-2010 of Oliver Georgi. Extensions are copyright of' },
{ :text=>'	created by Oliver Georgi (oliver at phpwcms dot de) and licensed under GNU/GPL.' },

]

# Version detection using html comment
def passive
        m=[]

        if @body =~ /phpwcms \| open source web content management system/
		if @body =~ /          Release: ([\d\.\-A-Z]+) [\d\-]+\/\/-->/
			version=@body.scan(/          Release: ([\d\.\-A-Z]+) [\d\-]+\/\/-->/)[0][0]
			m << {:version=>version}
	        end
	end

        m

end

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added website parameter and description
##
Plugin.define "phpMyTourney" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.2"
description "phpMyTourney is a PHP and MySQL script provide tournament hosting. Websites used to be http://phpmytourney.sourceforge.net/ and http://phpmytourney.servegame.com/"
website "https://sourceforge.net/projects/phpmytourney/"
# 23 results for "Powered by phpmytourney" +Version @ 2010-08-29

# Dorks #
dorks [
'"Powered by phpmytourney" "Version"'
]



matches [

# Powered by text
{ :text=>"Powered by <a href=\"http://phpmytourney.sourceforge.net/\"><font face='Arial' size='1'>phpMyTourney</font> </a>" },

# Error page
{ :text=>'ERROR : page not properly called' },

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /Powered by <a href="http:\/\/phpmytourney.sourceforge.net\/"[^>]+>phpMyTourney<\/a>./
		if @body =~ /Version ([\d\.a-z]+)/
			version=@body.scan(/Version ([\d\.a-z]+)/)[0][0]
	                m << {:version=>version}
		end
        end

	if @body =~ /Powered by <a href="[http:\/\/]*phpmytourney.sourceforge.net\/"><font color="#999933">phpMyTourney<\/font><\/a>.Version [\d\.a-z]+/
		version=@body.scan(/Powered by <a href="[http:\/\/]*phpmytourney.sourceforge.net\/"><font color="#999933">phpMyTourney<\/font><\/a>.Version ([\d\.a-z]+)/)[0][0]
		m << {:version=>version}
	end

        m

end


end


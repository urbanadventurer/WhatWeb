##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability

Plugin.define "JQuery" do
author "Andrew Horton"
version "0.2"
description "Javascript library"

# identifying strings
# <script type='text/javascript' src='http://blog.core-ed.net/derek/wp-includes/js/jquery/jquery.js?ver=1.2.3'></script>
# <script src="/javascript/jquery-1.2.6.pack.js" type="text/javascript" charset="utf-8"></script>
# <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js" type="text/javascript"></script>

extra_urls ["/js/jquery.js"]


def passive
	m=[]
	
	if @body =~ /<script [^>]*(jquery.(min.)?js)[^>]*/
		match=true
		result=@body.scan(/(jquery.js)(\?ver=)([0-9\.]*)['"]/)
		v=result[0][2]  if result.flatten.size == 3
		m << {:name=>"script",:version=>v}
	end

	m
end

end



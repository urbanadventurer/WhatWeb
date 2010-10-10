##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "B2Evolution" do
author "Aung Khant, http://yehg.net"
version "0.1"
description "B2Evolution is a powerful blog tool you can install on your own website."

examples=%w|
http://demo.b2evolution.net/
|	

matches [
{:name=>"meta generator tag", :text=>'<meta name="generator" content="b2evolution'},
{:name=>"poweredBy", :text=>'<div class="powered_by"><a href="http://b2evolution.net/"'},
{:url=>'?tempskin=_rss2', :text=>'<admin:generatorAgent rdf:resource="http://b2evolution.net/'},
{:url=>'?tempskin=_rss0.8',:tagpattern=> 'div,h3,/h3,p,/p,p,a,/a,/p,/div,div,h3,/h3,a,/a,/div,/body,/html',:text=>'An unexpected error has occurred!' },

]

def passive
	m=[]

	if @body =~ /<meta name=\"generator\" content=\"b2evolution [ ]?[0-9\.]+\"/
		version=@body.scan(/<meta name=\"generator\" content=\"(b2evolution)[ ]?([0-9\.]+)\"/)[0][1]
		m << {:name=>"meta generator tag",:version=>version} 
	end	
	m
end

end




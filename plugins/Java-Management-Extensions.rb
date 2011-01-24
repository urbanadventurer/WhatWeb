##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Java-Management-Extensions" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "Java Management Extensions (JMX) is a Java technology that supplies tools for managing and monitoring applications, system objects, devices (e. g. printers) and service oriented networks. - info: http://en.wikipedia.org/wiki/Java_Management_Extensions"

examples %w|
jira.hyperic.com/secure/attachment/27696/resin-discover.log
jira.hyperic.com/secure/attachment/28416/agent.log
forums.hyperic.com/jiveforums/servlet/JiveServlet/download/1-11046-35515-2544/testrun.log
jira.hyperic.com/secure/attachment/30701/Remote+Gemfire+agent.log
|

matches [

# Timestamp
{ :regexp=>/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]+ [DEBUG|INFO]/ },

]

def passive
	m=[]

	# Extract URL
	if @body =~ /jmx.url=([^,^\}^\s]+)/
		version=@body.scan(/jmx.url=([^,^\}^\s]+)/)[0][0]
		m << {:version=>version}
	end

	# Extract username and password
	if @body =~ /jmx.username=([^,^\}^\s^\n]+)/ and @body =~ /jmx.password=([^,^\}^\s^\n]+)/
		modules=@body.scan(/jmx.username=([^,^\}^\s^\n]+)/)[0][0]+":"+@body.scan(/jmx.password=([^,^\}^\s^\n]+)/)[0][0]
		m << {:module=>modules}
	end

	m

end

end


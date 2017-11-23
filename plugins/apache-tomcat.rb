##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Plugin to detect tomcat 
# Comment from Andrew Horton - this plugin includes code for a 404 page probe which should be incorporated into whatweb itself
##
# v0.3 by Andrew Horton
# renamed plugin from Tomcat to Apache-Tomcat, added aggressive /RELEASE-NOTES.txt to get version, added footer version, added /manager/status tests
# to-do, an invalid HTTP verb to a .JSP will reveal Tomcat if nothing else does, e.g. XXX /foobar/.jsp HTTP/1.0
##
# v0.4 update by Code0x58
# change random string function and new aggressive plugin behaviour
#
##

Plugin.define do
	name "Apache-Tomcat" 
	author "Louis Nyffenegger"
	description "Apache Tomcat Web Server"
	website "http://tomcat.apache.org/"
	version "0.4"

	matches [
		#
		# Apache tomcat in title from default page
		{	:name=>"tomcat in title",
			:regexp=>/<title>Apache Tomcat<\/title>/},
			
		# CATALINA_HOME/webapps/ROOT/index.html
		# by default tomcat homepage contains this file name
		{	:name=>"catalina home",
			:regexp=>/CATALINA_HOME\/webapps\/ROOT\/index\.html/},

		{ :name=>"/RELEASE-NOTES.txt", :url=>"/RELEASE-NOTES.txt", :version=>/Apache Tomcat Version ([0-9\.]+)/},
		{ :name=>"/RELEASE-NOTES.txt", :url=>"/RELEASE-NOTES.txt", :string=>/(\$Id: RELEASE-NOTES[^\$]+)/},
		{ :name=>"Java Stack Trace Error", :regexp=>/org\.apache\.tomcat\..*java\.lang\.Thread\.run/},
		{ :name=>"Tomcat admin /manager/status", :url=>"/manager/status", :text=>"tomcat"},
		{ :name=>"Footer", :version=>/Apache Tomcat\/([0-9\.]+)<\/h3><\/body><\/html>/}


	]
	
	aggressive do
		##
		# get a random page to check for default 404 tomcat page
		# TODO: consider using 404 matching more, caching could be used
		## 
		random_string = (1..length).map{|i| ('a'..'z').to_a[rand(26)]}.join
		target = "http://#{@base_uri.host}:#{@base_uri.port.to_s}/#{random_string}"
		info = []

		begin 
			status, _, _, body, _ = open_target(target)
						
			if status == 404
				v = body.scan(/Apache Tomcat\/([456]\.\d+\.\d+)/)[0]
				unless v.nil?
					info <<  {:name=>"Tomcat version", :certainty=>100, :version=>v}
				end
			end
		rescue
		
		end
		info
	
	end

	#TODO version can also be retrieve from 500 error page
	
	
end

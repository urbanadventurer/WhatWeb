##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
	name "ElasticSearch"
	authors [
		"Andrew Hortons", # v0.1 # 2020-10-06 # Created plugin
	]
	version "0.1"
	description "Elasticsearch is a distributed RESTful search engine built for the cloud. Built on top of Apache Lucene."
	website "https://github.com/elastic/elasticsearch"

	# Default Port 9200
	# content-type: application/json

	# Matches #
	matches [

		{ :name => "Tagline", :url =>"/", :status => 200, :text => "\"tagline\" : \"You Know, for Search\"\n}" },

		{ :name => "JSON version.number", :url => "/", :status => 200, :version => /"name" : "[^"]+",\s+"cluster_name" : "[^"]+",\s+"cluster_uuid" : "[^"]+",\s+"version" : {\s+"number" : "([^"]+)"/ }

	] 

end

##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "OpenSearch"
authors [
  "Caleb Anderson",
  # v0.2 # 2011-03-05 # Updated string detection. 
]
version "0.2"
description "This plugin identifies open search and extracts the URL. OpenSearch is a collection of simple formats for the sharing of search results."
# More Info: http://www.opensearch.org/ 



# Matches #
matches [

# Link tag
{:name=>"open search",
:regexp=>/<link[^>]+type=["']?application\/opensearchdescription\+xml['"]?[^>]*>/i },

# Extract URL
{ :string=>/<link[^>]+href[\s]*=[\s]*["']([^'^"^>]+)["'][^>]+type[\s]*=[\s]*["']?application\/opensearchdescription\+xml['"]?[^>]*>/i },

{ :string=>/<link[^>]+type[\s]*=[\s]*["']?application\/opensearchdescription\+xml['"]?[^>]+href[\s]*=[\s]*["']([^'^"^>]+)["'][^>]*>/i },

]

end


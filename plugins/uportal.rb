##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "uPortal"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-13
  # v0.2 # Updated version detection. 
]
version "0.2"
description "uPortal"

# About 1,790 results for "powered by uportal" @ 2010-06-13

# Dorks #
dorks [
'"powered by uportal"'
]



matches [

# GHDB Match
{ :ghdb=>'"powered by uportal"', :certainty=>75 },

# Version detection # Default logo HTML
{ :version=>/<img[^>]*alt="Powered by uPortal ([\d\.]+)"[^>]*>/ },

# Version detection # Powered by text
{ :version=>/<a target="_blank" title="Powered by \$" href="http:\/\/www.uportal.org">Powered by uPortal ([^<]+)<\/a>/ },

]

passive do
        m=[]

	if @headers["uportal-version"] =~ /uPortal_rel-([\-0-9]+)/i
		v=@headers["uportal-version"].scan(/uPortal_rel-([\-0-9]+)/i)[0][0]
		m << {:name=>"uportal-version header",  :version=>v }
	end

        m

end

end


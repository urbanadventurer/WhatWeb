##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Liferay"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2010-06-13
  # v0.2 # Update version detection and ghdb match. 
  # v0.3 # Update version detection and added cookie and javascript matches. 
]
version "0.3"
description "Liferay Portal is an enterprise web platform for building business solutions that deliver immediate results and long-term value."
website "http://www.liferay.com/"

# ShodanHQ results as at 2012-04-23 #
# 707 for COOKIE_SUPPORT GUEST_LANGUAGE_ID
# 650 for liferay-portal

# Google results as at 2012-04-23 #
# 208 for "Powered by Liferay Portal"
#  90 for "Powered by Liferay Portal" -site:liferay.com

# Dorks #
dorks [
'"Powered by Liferay Portal"'
]



# Matches #
matches [

# Powered by text
{ :text=>"Powered by Liferay Portal", :certainty=>10 },

# JavaScript # Liferay.Util.addInputFocus()
{ :text=>"<![CDATA[*/Liferay.Util.addInputFocus();/*]]>*" },

# HTTP Header # Liferay-Portal # Edition Detection
{ :search=>"headers[liferay-portal]", :string=>/^Liferay Portal (.+ Edition) (.+)$/ },

# HTTP Header # Liferay-Portal # Version Detection
{ :search=>"headers[liferay-portal]", :version=>/^Liferay Portal (.+ Edition) (.+)$/, :offset=>1 },

# HTTP Header # Set-Cookie # GUEST_LANGUAGE_ID
{ :search=>"headers[set-cookie]", :regexp=>/GUEST_LANGUAGE_ID=[a-z]{2,3}_[A-Z]{2,3};/ },

]

end


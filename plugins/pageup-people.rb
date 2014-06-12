##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PageUp-People" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-03
version "0.1"
description "homepage: http://www.pageuppeople.com/"

# Google results as at 2010-07-02 #
# 216 for "Powered by PageUp People"

# Dorks #
dorks [
'"Powered by PageUp People"'
]



# Matches #
matches [

# GHDB
{:ghdb=>'"Powered by PageUp People"', :certainty=>75 },

# Powered by text
{:text=>'<a class="pageupLink" href="http://www.pageuppeople.com" target="self">Powered by PageUp People</a>' },

]

# Passive #
def passive
        m=[]

	# sPULastSelectedLanguage Cookie
        m << { :name=>"sPULastSelectedLanguage Cookie" } if @headers["set-cookie"] =~ /sPULastSelectedLanguage=/

	# Return passive matches
        m
end

end


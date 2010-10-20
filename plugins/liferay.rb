##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Update version detection and ghdb match
##
Plugin.define "Liferay" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.2"
description "Liferay Portal is an enterprise web platform for building business solutions that deliver immediate results and long-term value. - homepage: http://www.liferay.com/"

# 26 results for "Powered by Liferay Portal" @ 2010-06-13
examples %w|
www.liferay.com
www.optionsnet.gr/c/portal/
www.mcnolia.com/web/
vm-20.liferay.com/community/
|

matches [

{ :ghdb=>'"Powered by Liferay Portal"', :certainty=>75 },

]

# Version detection
def passive
        m=[]

	if @meta["liferay-portal"] =~ /([\s]*)/
		version=@meta["liferay-portal"].to_s
		m << { :version=>version }
	end

        m

end


end


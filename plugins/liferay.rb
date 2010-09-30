##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Liferay" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.1"
description "Liferay Portal is an enterprise web platform for building business solutions that deliver immediate results and long-term value. - homepage: http://www.liferay.com/"
examples %w|
www.liferay.com
www.optionsnet.gr/c/portal/
www.mcnolia.com/web/
vm-20.liferay.com/community/
|

matches [

# 26 results @ 2010-06-13
{:name=>'GHDB: "Powered by Liferay Portal"',
:certainty=>75,
:ghdb=>'"Powered by Liferay Portal"'
}

]

def passive
        m=[]

	if @meta["liferay-portal"] =~ /[0-9A-Za-z\(\)\.\"\'\\\/\-_,]+/i
		v=@meta["liferay-portal"].scan(/([0-9A-Za-z\s\(\)\.\"\'\\\/\-_,]+)/i)[0].to_s
		m << {:name=>"liferay-portal header", :version=>v }
	end

        m

end


end


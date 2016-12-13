##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iRealty" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "iRealty is an advanced flexible php real estate software and CMS with open source code."
website "http://www.irealtysoft.com/"

# 52 results for "powered by iRealty" @ 2010-08-08

# Dorks #
dorks [
'"powered by iRealty"'
]



matches [

{ :text=>'Powered by <a href="http://www.irealty.com/" title="iRealty"> iRealty </a>' },

{ :text=>'<a target="_blank" href="http://www.irealtysoft.com/">- Powered by iRealty</a>' },

{ :text=>'Powered by <a target="_blank" title="iRealty &mdash; Real Estate Listing Software" href="http://www.irealtysoft.com/">iRealty</a>,' },

{ :text=>'Powered by <a target="_blank" title="iRealty &mdash; Real Estate Listing Software" href="http://www.worksforweb.com/products/iRealty/">iRealty</a>,' },

]

# Match PHPSESSID%28_%29 cookie
def passive
        m=[]

	m << { :name=>"iRealty PHPSESSID%28_%29 cookie" } if @headers["set-cookie"] =~ /^PHPSESSID%28_%29=[a-z0-9]{32}/

        m

end


end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MySource-Matrix" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "MySource Matrix is a feature-rich, enterprise-class Supported Open Source CMS (Content Management System)."
website "http://www.squiz.co.uk/mysource-matrix-open-source-cms"

# 84 results for "powered by Mysource matrix" @ 2010-09-04

# Dorks #
dorks [
'"powered by Mysource matrix"'
]



matches [

# Powered by text
{ :text=>'<p class="right">Powered by <a href="http://www.squiz.co.uk/mysource_matrix" target="_blank">MySource Matrix</a></p>' },
{ :text=>'class="squiz">Powered by MySource Matrix - a Squiz.net initiative</a> </div>  </div>' },
{ :text=>'<p>Powered By MySource Matrix - A Squiz.net  Initiative</p>' },

# HTML comment
{ :text=>'  MySource, MySource Matrix and Squiz.net are registered Trademarks of Squiz Pty Ltd' },

]

# Version detection
def passive
        m=[]

	# Powered by text
	if @body =~ /Powered by <a href="http:\/\/www.squiz.[^>]+>/
		if @body =~ /MySource Matrix ([\d\.]+)/
	                version=@body.scan(/MySource Matrix ([\d\.]+)/)[0][0]
			m  << {:version=>version}
		end
        end

	# HTML comment
	if @body =~ /	Running Squiz MySource v([\d\.]+) \(Matrix\) - http:\/\/matrix.squiz.net\//
		version=@body.scan(/	Running Squiz MySource v([\d\.]+) \(Matrix\) - http:\/\/matrix.squiz.net\//)[0][0]
		m << {:version=>version}
	end

        m

end


end


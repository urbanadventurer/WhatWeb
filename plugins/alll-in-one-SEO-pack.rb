##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "All-in-one-SEO-Pack" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "Wordpress plugin. Automatically optimizes your WordPress blog for Search Engines (Search Engine Optimization). - homepage: http://wordpress.org/extend/plugins/all-in-one-seo-pack/"

examples %w|
http://michaeltorbert.com/
|

matches [

# HTML comments
{ :text=>'<!-- /all in one seo pack -->' },

]

# Version detection using HTML comemnt
def passive
        m=[]

        if @body =~ /<!-- All in One SEO Pack ([\d\.]+) by Michael Torbert of Semper Fi Web Design/
                version=@body.scan(/<!-- All in One SEO Pack ([\d\.]+) by Michael Torbert of Semper Fi Web Design/)[0][0]
                m << {:version=>version}
        end

        m

end


end


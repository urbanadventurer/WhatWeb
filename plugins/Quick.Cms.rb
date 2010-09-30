##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Quick.Cms" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "Freeware, fast and easy to customize Content Management System. - homepage: http://opensolution.org/quick.cms,en,10.html"

# 298 results for "powered by Quick.Cms" @ 2010-08-30
examples %w|
opensolution.org/Quick.Cms/demo_lite/
opensolution.org/Quick.Cms/demo_lite/admin.php
opensolution.org/Quick.Cms/demo/
opensolution.org/Quick.Cms/demo/admin.php
opensolution.org/Quick.Cms/demo_ext/
opensolution.org/Quick.Cms/demo_ext/admin.php
www.teramoney.com
www.completewoodworking.co.cc
www.completewoodworking.co.cc/admin.php
www.perfectionbody.com
www.perfectionbody.com/admin.php
www.anticaresidenzadelgallo.com
www.anticaresidenzadelgallo.com/admin.php
www.internetmarketingsite101.com
www.internetmarketingsite101.com/admin.php
www.pharmaprofessionals.eu
www.pharmaprofessionals.eu/admin.php
|

matches [

# Admin page
{ :text=>'  <title>Admin - Quick.Cms - simple content management system</title>' },
{ :text=>'    var cfLangNoWord      = "Please fill in all required fields";' },

# Powered by text
{ :text=>'      <div class="foot" id="powered"><a href="http://opensolution.org/">Powered by <strong>Quick.Cms</strong></a></div>' },

# HTML comment text
{ :text=>'        LICENSE REQUIREMENTS - DONT DELETE/HIDE LINK "powered by Quick.Cms" TO www.OpenSolution.org' },

# Meta author
{ :text=>'  <meta name="Author" content="OpenSolution.org" />' },

]

# Version detection using admin page
def passive
        m=[]

        if @body =~ /      <div id="version"><a href="http:\/\/opensolution.org\/">Quick.Cms v([\d\.]+)<\/a><\/div>/
                version=@body.scan(/      <div id="version"><a href="http:\/\/opensolution.org\/">Quick.Cms v([\d\.]+)<\/a><\/div>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


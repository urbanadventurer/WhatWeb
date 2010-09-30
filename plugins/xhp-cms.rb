##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "XHP-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "XHP CMS - eXpandable Home Page is an easy to install, easy to use, easy to expand content management system (CMS) written in PHP and using MySQL as the database engine. - homepage: http://xhp.targetit.ro/"

# 22 results for "powered by XHP CMS" "Site engine is copyright" @ 2010-08-08
examples %w|
xhp.targetit.ro
eclipse-sdcc.sourceforge.net
royal-african-stone.com/XHP/
www.validtradeantiques.co.za
www.boorysbusinessmachines.com
bytepoker.com
www.dwmchan.com/xhp/
www.mitfun.ro
ecu.gt28.ru
sarberki-minerva.hu
darkrula.net46.net
www.nicolai.jellevedel.dk
|

matches [

# Versions 0.5+ have been spotted with this meta generator tag:
# <meta name="GENERATOR" content="XHP - eXpandable Home Page v0.4"/>
{ :regexp=>/<meta name="GENERATOR" content="XHP - eXpandable Home Page v[\d\.]+"\/>/ },

# Installation page
{ :text=>'<title>XHP installation</title>' }

]

# Version detection with "Powered By" footer
def passive
        m=[]

        if @body =~ /<a href="http:\/\/xhp.targetit.ro\/">Powered by XHP CMS v[\d\.]+<\/a><br\/><a href="http:\/\/lars.targetit.ro\/">Site engine is copyright/
                version=@body.scan(/<a href="http:\/\/xhp.targetit.ro\/">Powered by XHP CMS v([\d\.]+)<\/a><br\/><a href="http:\/\/lars.targetit.ro\/">Site engine is copyright/)[0][0]
                m << {:version=>version}
        end

        m

end


end


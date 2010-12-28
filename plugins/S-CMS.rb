##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "S-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-30
version "0.1"
description "CMS - homepage: http://www.matteoiammarrone.com/public/s-cms/"

# 8 results for "powered by S-CMS" @ 2010-08-30
examples %w|
www.scms.nl/admin/admin.asp
www.vipcomp.sk
www.vipcomp.sk/admin/admin.asp
www.opravafotoaparatov.sk
www.matteoiammarrone.com/public/s-cms/
www.scms.altervista.org/fluid/
|

matches [

# Powered by text
{ :text=>'        <p class="alignRight">Powered by S:CMS - Copyright © 2010 Pd&p</p>' },

# Admin page
{ :text=>'<title>SCMS</title>' },

# HTML comment - translated: Top row indexing in search engines
{ :text=>'<!-- Inizio righe di indicizzazione nei motori di ricerca -->' },

]

# Version detection
def passive
        m=[]

        if @body =~ /Powered by <a href='http:\/\/www.matteoiammarrone.com\/public\/s-cms' target='_blank'>S-Cms ([\d\.]+)<\/a>/
                version=@body.scan(/Powered by <a href='http:\/\/www.matteoiammarrone.com\/public\/s-cms' target='_blank'>S-Cms ([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


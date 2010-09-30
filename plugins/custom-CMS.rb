##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Custom-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-03
version "0.1"
description "Custom CMS Gaming is a Content Management System geared towards all Gamers that would like to maintain and create fully functional gaming sources.  - homepage: http://www.customcms.net/"

# 165 results for "powered by CCMS" @ 2010-09-03
examples %w|
gameworldcheats.com
www.tolvuleikir.is
www.blpnetwork.com/index.php
nintygamer.co.za/index.php
ihrgamingnet.com
www.playstation-3.co.za
moddit.net
gcult.the-chosen.ch
www.gamezbox.co.uk/index.php
www.thegamepanel.com/index.php
gamersweb.info
www.megportal.com
|

matches [

# Default title
{ :text=>' - Powered by CCMS</title>', :certainty=>75 },

# Meta generator
{ :text=>'<meta name="generator" content="CustomCMS Gaming" />' },

]

# Version detection using logo alt text
def passive
        m=[]

        if @body =~ /power.png" border="0" style="margin-top: 7px;" alt="" title="Powered by CCMS v([\d\.]+)" \/><\/a>/
                version=@body.scan(/power.png" border="0" style="margin-top: 7px;" alt="" title="Powered by CCMS v([\d\.]+)" \/><\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


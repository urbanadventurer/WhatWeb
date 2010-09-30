##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Linksys-NAS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-15
version "0.1"
description "Linksys NAS web frontend - homepage: http://www.linksys.com/"

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1669
# 2 results for intitle:"Ethernet Network Attached Storage Utility" @ 2010-07-15
examples %w|
krxo.serveftp.com
prominence.info
|

matches [

{:text=>'<html><head><title>Ethernet Network Attached Storage  Utility</title>' },

{:text=>'	<td nowrap colspan="3"><img src="Admin_top.JPG" width="750" height="52" alt="" border="0" hspace="0" vspace="0"></td>' },


]

def passive
        m=[]

        if @body =~ /	 <td nowrap class="hst">&nbsp; &nbsp;Version:<\/td>/
                version=@body.scan(/	          <td nowrap class="hst">V([\d\.a-zA-Z]+)<\/td>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


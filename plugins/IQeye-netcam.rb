##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IQeye-Netcam" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-11
version "0.1"
description "IQeye netcam web interface"

# 5 results for intitle:"IQeye302 | IQeye303 | IQeye601 | IQeye602 | IQeye603" intitle:"Live Images" @ 2010-07-11
examples %w|
ocwx.com
161.53.240.140
203.122.250.159
|

def passive
        m=[]

        if @body =~ /<[TITLE|title]*>IQeye[a-zA-Z0-9\ \-_]+: Live Images/
                version=@body.scan(/<[TITLE|title]*>IQeye([a-zA-Z0-9\ \-_]+): Live Images/)[0][0]
                m << {:version=>version}
        end

        m

end


end


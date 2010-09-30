##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "i-Catcher-Console" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "i-Catcher is a Digital CCTV system for security, surveillance and remote monitoring applications. - homepage: http://www.icode.co.uk/icatcher/"

# 22 results for "please visit" intitle:"i-Catcher Console" Copyright "iCode Systems" @ 2010-07-20
# About 189 Shodan results for Server:i-Catcher Console @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=751
examples %w|
cctv.icode.co.uk
cctv.rockwellcottage.com:82
94.185.130.197
81.86.49.152:3409/index.htm
82.69.29.127
84.92.154.5:8080/index.htm
166.70.231.34
81.136.158.35
216.254.135.35
81.149.9.153
70.15.242.34
81.149.203.34
217.41.62.178
81.149.107.89
|

matches [

{ :text=>'   // These vars will be filled in by i-Catcher Console' },

{ :text=>' <title>i-Catcher Console - Live view</title>' },

{ :regexp=>/     i-Catcher Console is Copyright [\d]{4}-[\d]{4} <a[\ class="footer"]* href="http:\/\/www.icode.co.uk\/">iCode Systems<\/a>./ },

]

def passive
        m=[]

        if @body =~ /     i-Catcher Console [\d\.]+ is Copyright [\d]{4}-[\d]{4} <a class="footer" href="http:\/\/www.icode.co.uk\/">iCode Systems<\/a>./
                version=@body.scan(/     i-Catcher Console ([\d\.]+) is Copyright [\d]{4}-[\d]{4} <a class="footer" href="http:\/\/www.icode.co.uk\/">iCode Systems<\/a>./)[0][0]
                m << {:version=>version}
        end

        m

end


end


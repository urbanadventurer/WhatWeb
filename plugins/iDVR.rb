##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iDVR" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "iDVR (formerly Devloution Security System) is a video surveillance system for the Linux/X11 platform. - homepage: http://code.google.com/p/idvr/"
# default login: administrator/blank

# http://www.hackersforcharity.org/ghdb/?function=detail&id=1393
# 247 Google results for intitle:iDVR -intitle:"com | net | shop" -inurl:"asp | htm | pdf | html | php | shtml | com | at | cgi | tv" @ 2010-07-20
examples %w|
68.15.38.73
68.89.135.133
71.40.164.156
71.98.250.171
72.45.156.138
74.218.49.10
75.17.27.107
208.125.177.54
208.125.189.126
209.220.222.14
213.79.40.116
220.162.158.162/adv/
www.avinfo.cn/adv/
|

matches [

{ :text=>'<title>iDVR</title>' },
{ :regexp=>/	  	'	  codebase="http:\/\/' + szDomainFull + '\/NSIDVRCtrlX.ocx#version=[\d]{1},[\d]{1},[\d]{1},[\d]{1}"\n'\+/ },
{ :text=>'		\'	  classid="clsid:16A017B9-6CB4-47C7-8E81-6E9396FAC2B6"\\n\' +' },
{ :regexp=>/		monitorDiv.innerHTML = "<object id='monitorObject' style='display:none' classid='clsid:574B47E8-A366-4AB9-B2EA-57F145CA3780' codebase='lib\/monitor.cab#version=[\d]{1},[\d]{1},[\d]{1},[\d]{1}' VIEWASTEXT><\/object>";/ },

]

def passive
        m=[]

        if @body =~ /<title>iDVR /
                version=@body.scan(/[\d\.]+ \(Build ([\d\.]+)\)<\/title>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


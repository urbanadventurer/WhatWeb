##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IPCop-Firewall" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "The IPCop Firewall is a Linux firewall distribution. It is geared towards home and SOHO users. The IPCop web-interface is very user-friendly and makes usage easy. - homepage: http://sf.net/projects/ipcop/"

# 5 results for intitle:"ipcop . main" @ 2010-07-20
# http://www.hackersforcharity.org/ghdb/?function=detail&id=831
examples %w|
https://207.63.8.142:445/cgi-bin/index.cgi
|

matches [

{ :text=>"    <title>IPCop - Main page</title>" },

{ :text=>'    <style type="text/css">@import url(/include/ipcop.css);</style>' },

{ :text=>"	<td valign='bottom'><a href='http://sf.net/projects/ipcop/' target='_blank'><img src='/images/sflogo.png' width='88' height='31' alt='Sourceforge logo' /></a></td>" },

{ :text=>"<td style='background-color: #EAE9EE;' align='left' width='100%'><b>Home</b> | <a href='/cgi-bin/updates.cgi'>Updates</a> | <a href='/cgi-bin/changepw.cgi'>Passwords</a> | <a href='/cgi-bin/remote.cgi'>SSH Access</a> | <a href='/cgi-bin/gui.cgi'>GUI Settings</a> | <a href='/cgi-bin/backup.cgi'>Backup</a> | <a href='/cgi-bin/shutdown.cgi'>Shutdown</a> | <a href='/cgi-bin/credits.cgi'>Credits</a></td></tr></table>" },

]

def passive
        m=[]

        if @body =~ /	    <img src='\/images\/null.gif' width='1' height='29' alt='' \/>[\d\.]+<\/td>/
                version=@body.scan(/	    <img src='\/images\/null.gif' width='1' height='29' alt='' \/>([\d\.]+)<\/td>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


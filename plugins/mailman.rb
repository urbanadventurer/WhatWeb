##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Mailman" do
author "Tonmoy Saikia"
version "0.1"
description "Mailman is free software for managing electronic mail discussion and e-newsletter lists. WEB:http://www.gnu.org/software/mailman/index.html"
examples %w|
http://mail.opensolaris.org/mailman/listinfo
https://dev.eclipse.org/mailman/listinfo/
http://lists.hosef.org/listinfo.cgi
http://lists.apple.com/
http://mailman.metu.edu.tr/mailman/listinfo/
http://lists.natureserve.org/mailman/listinfo
http://mail.gnome.org/mailman/listinfo
http://ncsi.iisc.ernet.in/mailman/listinfo/lis-forum
http://www.daa.com.au/mailman/listinfo/pygtk
http://www.itk.org/mailman/listinfo/
http://lists.macosforge.org/mailman/listinfo.cgi
|

#<td><img src="/icons/mailman.jpg" alt="Delivered by Mailman" border=0><br>version 2.1.12</td>
#<td><a href="http://mailman.metu.edu.tr/mailman/listinfo/top-list"><strong>TOP-LIST</strong></a></td>
#<td><a href="http://mailman.metu.edu.tr/mailman/listinfo/ncc-yy"><strong>NCC-YY</strong></a></td>
#<td><a href="http://mailman.metu.edu.tr/mailman/listinfo/kayitsil"><strong>kayitsil</strong></a></td>

matches [
{:name=>"ghdb match",
:ghdb=>'inurl:mailman "Delivered by Mailman"'},

{:name=>"default text",
:text=>'<td><img src="/icons/mailman.jpg" alt="Delivered by Mailman" border=0><br>version'},

{:name=>"mailing list links",
:regexp=>/<a[^>]+href="http(s*):\/\/[^"]+mailman[^"]+"/}

]

#<td><img src="/icons/mailman.jpg" alt="Delivered by Mailman" border=0><br>version 2.1.13</td>
def passive
        m=[]

        if @body =~ /alt="Delivered by Mailman"[^>]+><br>version\s(\d.\d.[0-9a-z]+)/
                version=@body.scan(/alt="Delivered by Mailman"[^>]+><br>version\s(\d.\d.[0-9a-z]+)/)[0][0]
                m << {:name=>"powered by version text",:version=>version}
        end

        m
end


end


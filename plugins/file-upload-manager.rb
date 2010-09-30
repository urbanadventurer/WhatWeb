##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "File-Upload-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-05 
version "0.1"
description "Web based file upload manager written in PHP. - homepage:http://www.mtnpeak.net"
examples %w|
www.ancea.org/fileupload/
www.philadelphiaprint.com/fileupload/
adds.n6230i.net/apps/
www.psycho.compnet.com.pl/ff/
www.akroncigarclub.com/fileman/index.php
ellipsisanalytics.com/uploads/
reallab.info/up/
www.fotomi.pl/0up/
www.cmstudio.pl/anonim/
dtti.prv.pl/upload/
kusunoki.ty.land.to/party-upload/
www.libor-ri.hr/fileupload/
www.worldalpinerockfest.com/submit/
www.lolomg998.za.pl/upload.php
lnx.gtiuruguay.com/phr/
klikni.hit.bg/
125.162.92.55/upload/
cuonglv.110mb.com/upload/
dv8.homelinux.net/upload_page.php
www.rastodolix.ovh.org/upload/upload.php
|

matches [

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=734
# About 559 results @ 2010-06-05
{:name=>'GHDB: +intitle:"File Upload Manager" "rename to" "file types allowed"',
:certainty=>75,
:ghdb=>'+intitle:"File Upload Manager" "rename to" "file types allowed"'
},

{:name=>"default title", 
:text=>'<title>File Upload Manager</title>'
},

{:name=>"default copyright comment",
:text=>'<!-- Copyright (c) 2003 thepeak. Get your own copy of this free PHP script from www.mtnpeak.net -->'
},

{:name=>"default copyright text",
:text=>'<a href="http://www.mtnpeak.net" style="text-decoration: none; color: #C0C0C0; font-size: 9px; cursor: default";>&copy; thepeak</a>'
}

]

def passive
        m=[]

        if @body =~ /<!-- File Upload Manager v([\d\.]+)[^>]+ -->/
                version=@body.scan(/<!-- File Upload Manager v([\d\.]+[^>]+) -->/)[0][0] 
                m << {:name=>"html comments",:version=>version}
        end

        m
end

end


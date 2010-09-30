##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Turbo-Seek" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-15 
version "0.1"
description "Turbo Seek enables anyone to build a Search Engine & Directory Portal with the minimum expense and effort. - homepage: http://www.focalmedia.net/index_tb.html"

examples %w|
www.vermontbridemagazine.com/cgi/tseekdir.cgi
www.namsearch.com/cgi-bin/tseekdir.cgi
www.chatrooms.uk.com/cgi-bin/tsearch/tseekdir.cgi
www.cyprus-directory.com/cgi-bin/tseekdir.cgi
www.obesityresource.com/cgi-bin/tseekdir.cgi
www.webdropshipper.com/cgi-bin/tseekdir.cgi
ebookdirectory.com/cgi-bin/tseekdir.cgi
www.sangeetbhubon.com/cgi-bin/tseekdir.cgi
www.videosilva.com/cgi-bin/tseekdir.cgi
www.philippines.com.au/cgi-bin/global/tseekdir.cgi
www.obxonline.com/cgi-bin/search/tseekdir.cgi
www.bettorstalk.com/cgi-bin/turboseek/tseekdir.cgi
www.jewishwebsight.com/bin/directory/tseekdir.cgi
www.chatrooms.uk.com/cgi-bin/tsearch/tseekdir.cgi
www.uknation.co.uk/cgi-uknation/turbo/tseekdir.cgi
duitsland-vakantieland.nl/cgi-bin/tseekdir.cgi
www.123sardegna.com/cgi-bin/tseekdir.cgi
www.mycreditsolver.com/cgi-bin/tseekdir.cgi
www.expeditecarrier.com/cgi-bin/tseekdir.cgi
www.essentialfemdom.com/cgi-bin/essentials/tseekdir.cgi
www.cockforum.com/cgi-bin/tseekdir.cgi
www.jesusjournal.com/cgi-bin/tseek/tseekdir.cgi
|

matches [

# http://www.hackersforcharity.org/ghdb/?function=detail&id=567
# About 7,440 results @ 2010-06-15
{:name=>'GHDB: filetype:cgi inurl:tseekdir.cgi',
:certainty=>75,
:ghdb=>'filetype:cgi inurl:tseekdir.cgi'
},

# unique javascript - no false positives on google - code from tsbuild.pm
# var myspecs = "'menubar=0,status=1,resizable=1,location=0,titlebar=1,toolbar=1,scrollbars=1,width=" + mywidth + ",height=" + myheight + "'";
{:name=>"uniquie javascript",
:certainty=>100,
:text=>'    var myspecs = "\'menubar=0,status=1,resizable=1,location=0,titlebar=1,toolbar=1,scrollbars=1,width=" + mywidth + ",height=" + myheight + "\'";'
},

]

end



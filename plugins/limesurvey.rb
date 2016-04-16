##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Lime-Survey" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06 
version "0.1"
description "LimeSurvey basically contains everything you need for doing nearly every survey with grace."
website "http://www.limesurvey.org/"

# Dorks #
dorks [
'"The following surveys are available" "The Online Survey Tool - Free & Open Source"'
]



matches [

# About 48,200 results @ 2010-06-06
{:name=>'GHDB: +"The following surveys are available" +"The Online Survey Tool - Free & Open Source"',
:certainty=>75,
:ghdb=>'+"The following surveys are available" +"The Online Survey Tool - Free & Open Source"'
},

{:name=>"default text", 
:text=>'<a href="http://www.limesurvey.org" target="_blank"><font color="#000000">The Online Survey Tool</font></a> - Free & Open Source<br />'
},

{:name=>"meta generator",
:text=>'<meta name="generator" content="LimeSurvey http://www.limesurvey.org" />'
}

]

end


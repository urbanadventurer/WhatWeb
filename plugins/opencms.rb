##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OpenCms" do
author "Emilio Casbas" #mostly
version "0.1"
description "OpenCms, professional and eassy to use CMS. Homepage: http://www.opencms.org"

examples=%w|
http://www.opencms.org/
http://www.ccbh.net/
http://www.edgebox.net/
http://www.bng-galiza.org
http://www.area.trieste.it
http://www.bionet-intl.org
http://www.boersewien.at/
http://www.paradine.at/
http://www.eu2010.es/
|

#     <meta name="generator"     content="OpenCms" />

matches [

{:name=>"meta generator", 
:certainty=>100,
:regexp=>/<meta name="generator"[^>]+content="OpenCms/},

{:name=>"/opencms2/", 
:certainty=>25,
:regexp=>/(\/system\/modules\/|\/export\/system\/modules)/},

{:name=>"/opencms/", 
:certainty=>75,
:text=>"/opencms/"},

{:name=>"/opencms2/", 
:certainty=>75,
:regexp=>/\.opencms\./},

{:name=>"link or img tag with /opencms/ or export/systems/modules",
:certainty=>100,
:regexp=>/<(link|img) [^>]+(href|src)="[^"]+(\/opencms\/|\/export\/system\/modules)/}
] # "



def passive
	m=[]
	# note that http strings are downcased, so Server becomes server
	if @meta["server"] =~ /^OpenCms\/[0-9a-z\.]+/
		version=@meta["server"].scan(/^OpenCms\/([0-9a-z\.]+)/)[0][0]
		m << {:name=>"HTTP Server String", :certainty=>100, :version=>version } 
	end

	m
end

end




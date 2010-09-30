##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :probability

Plugin.define "IIS-UnderConstruction" do
author "Andrew Horton"
version "0.2"
description "Microsoft/IIS under construction page"
examples %w|202.175.135.202 210.48.77.70 203.167.230.151 203.89.176.95 210.48.87.203 203.109.206.1 |
# If you are the Web site administrator and feel you have received this message in error, please see &quot;Enabling and Disabling Dynamic Content&quot; in IIS Help.


matches [
{:name=>"Under construction error text", 
:version=>5,
:text=>'<id id="Comment1"><!--Problem--></id><id id="errorText">Under Construction</id></h1>'},

{:name=>"Under construction error text", 
:version=>6,
:text=>'<P ID=Comment1><!--Problem--><P ID="errorText">Under Construction</h1>'},

{:name=>"If you are the Web site administrator...", 
:version=>6,
:text=>'If you are the Web site administrator and feel you have received this message in error, please see &quot;Enabling and Disabling Dynamic Content&quot; in IIS Help.'},


{:name=>"Welcome image link", 
:version=>7,
:text=>'<a href="http://go.microsoft.com/fwlink/?linkid=66138&amp;clcid=0x409"><img src="welcome.png" alt="IIS7" width="571" height="411" /></a>'}
]


end


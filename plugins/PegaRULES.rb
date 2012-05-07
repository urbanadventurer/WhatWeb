##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "PegaRULES" do
author "Andrew Horton"
version "0.1"
description "PegaRULES Process Commander is BPM software from Pega. Many of the world's leading organizations use Pega to drive revenue growth, improve customer experience, and enhance operational efficiency. Pega's unified offering is recognized by industry analysts as a leader in CRM, BPM, case management and business rules. Homepage: http://www.pega.com/"

examples %w|http://205.223.230.13:8080/prweb/PRServlet https://usg-301.pegacloud.com:9443/prweb/PRServlet/ |

# extra URLs /prweb/
dorks [
'intitle:"Welcome to PegaRULES"',
'inurl:/prweb/PRServlet/'
]

matches [
{:name=>'cookie',:search=>"headers[set-cookie]",:text=>"Pega-RULES"},
{:name=>'title', :text=>'<title> Welcome to PegaRULES </title>' },
{:name=>'copyright footer',:regexp=>/<span>[^<]+Copyright[^<]+Pegasystems Inc/m},
{:name=>'shortcut icon',:text=>'<LINK REL="SHORTCUT ICON" HREF="images/pzPegaIcon.ico">'},
{:version=>/Welcome to PegaRULES.*<span id="ProductVersion" class="ProductVersion">Version ([^<]+)<\/span>/m}
]

end

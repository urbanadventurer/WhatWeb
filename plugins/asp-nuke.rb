##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Changelog
# Version 0.2
# Removed :name and :probility
# Version 0.3
# Uses :version=>//


Plugin.define "ASP-Nuke" do
author "Andrew Horton"
version "0.3"
description "ASP Nuke  homepage: www.aspnuke.com
ASP Nuke is an open-source software application for running a community-based web site on a web server. The requirements for the ASP Nuke content management system are: 1. Microsoft SQL Server 2000 and 2. Microsoft Internet Information Server (IIS) 5.0"




# http://www.portal.fezalar.org
# <meta name="Generator" CONTENT="ASP-Nuke community v1.4 SP4">
# <a href="/gotoURL.asp?url=/articles.asp?cat=8">FAQ - Asp-Nuke - HowTo</a>
# <div align='center'><b><span class='copyright'>&nbsp;&#169; 2002-2009 - Site Sahibine Ulasin - <a href="javascript:encodeemail('webmaster','fezalar.org');">webmaster (a) fezalar.org</a> - Site Tasarim <a href="http://www.rot.dk" target="_blank">Asp-Nuke</a> community v1.4 SP4
# 

# <meta name="Generator" content="ASPNUKE v2.0 - distributed under GPL license">
# <link rel="Shortcut Icon" href="http://www.fiei.it/aspnuke.ico">
# <span class="small"><a href="/gotoURL.asp?url=http%3A%2F%2Fwww%2Efilef%2Einfo" target="_blank">Filef INFO</a> (IT)</span><br>

# <a href="javascript:encodemail('fiei','fiei.org')">Contattami</a><br>
#			Realizzato con <a href="http://www.aspnuke.it" target="_blank">ASP-Nuke 2.0.7</a>&nbsp;derivato da <a href="http://www.asp-nuke.com" target="_blank">ASP-Nuke v1.2</a><br>

# http://www.asbru.dk/technet/
#<meta name="Generator" CONTENT="ASP-Nuke community v1.4 SP4">
# <form name='Authentication' method='post' action='/technet/authent.asp'>
# Designed with <a href="http://www.asp-nuke.net" target="_blank">ASP-Nuke</a> community v1.4 SP4

#P3P: CP="NOI CUR OUR IND UNI COM NAV INT"

matches [
{:text=>"<meta name=\"Generator\" CONTENT=\"ASP-Nuke" },
{:text=>"<meta name=\"Generator\" content=\"ASPNuke" }, 
{:version=>"2", :text=>"<meta name=\"Generator\" content=\"ASPNUKE v2.0 - distributed under GPL license\">" },
{:regexp=>/<a href="\/gotoURL.asp\?url=/ }, #"
{:text=>"<a href=\"http://www.rot.dk\" target=\"_blank\">Asp-Nuke</a> community" },
{:regexp=>/<link rel="Shortcut Icon" href="[^>]*aspnuke.ico">/ },
{:regexp=>/<a href="http:\/\/www.aspnuke.it" target="_blank">ASP-Nuke [0-9\.]*<\/a>/ },
{:regexp=>/<form name='Authentication' method='post' action='[^']*\/authent.asp'>/ }, #'
{:text=>"Designed with <a href=\"http://www.asp-nuke.net\" target=\"_blank\">ASP-Nuke</a>" },
{:version=>"v1.1+", :text=>"<br>Designed with ASP-Nuke v1.1+" },

{:version=>/<meta name="Generator" (content|CONTENT)="(ASPNUKE|ASP-Nuke) ([^->"]+)/, :offset=>2,  :name=>"meta generator tag" },

{:version=>/Designed with <a href="http:\/\/www.asp-nuke.net" target="_blank">ASP-Nuke<\/a> ([^<]+)<br>/,  :name=>"desgined by" },

{:version=>/<a href="http:\/\/www.aspnuke.it" target="_blank">Asp-Nuke ([\d\.]+)<\/a>/,  :name=>"aspnuke.it" },

]


def passive
   #P3P: CP="NOI CUR OUR IND UNI COM NAV INT"
   m=[]   
   m << {:name=>"P3P Privacy Headers", :certainty=>25 } if @headers["p3p"] == "CP=\"NOI CUR OUR IND UNI COM NAV INT\""
   
   m
end


end


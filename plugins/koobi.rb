##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-02 #
# Updated version detection
##
Plugin.define "Koobi" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-28
version "0.2"
description "Shop/CMS software [German]"
website "http://www.Dream4.de/"

# Google results as at 2010-08-28 #
# 262 for "powered by Koobi PRO|SHOP|CMS" -"SQL Injection"

# Dorks #
dorks [
'"powered by Koobi PRO|SHOP|CMS" -"SQL Injection"'
]



# Matches #
matches [

# powered by text
{ :regexp=>/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[^>]+>Koobi/i },

# HTML Comment
{ :text=>'<!-- powered by koobi - do not remove this info! -->' },

# Version Detection # Koobie Pro Powered by text
{ :version=>/powered by <a class="foot" href="http:\/\/www.dream4.de\/[^>]+>Koobi Pro ([\d\.]+)<\/a>/i, :string=>"Pro" },

# Version Detection # Meta generator
{ :version=>/<meta name="generator" content="\(c\) Koobi ([\d\.]+), http:\/\/www.dream4.de" \/>/ },

# Version Detection # Powered by text
{ :version=>/Powered by <a title="Koobi ist ein komfortables und leistungsf&auml;higes Content-Management-System \(CMS\) f&uuml;r Privatpersonen, Vereine, kleine und mittelst&auml;ndische Unternehmen, die einen professionellen Internetauftritt realisieren m&ouml;chten."[^>]*>Koobi[\ :]*(SHOP|PRO|CMS)<\/a> ([\d\.]+)/i, :offset=>1 },

# Version Detection # Powered by text
{ :version=>/Powered by <a[^>]+href="http:\/\/www.dream4.de\/cms\/content\/6\/koobi\/1\/">Koobi<\/a> (PRO|SHOP|CMS)[\s]*([\d\.\ a-z]+)/i, :offset=>1 },

# Version Detection # Old Koobi CMS powered by text
{ :version=>/powered by <a[^>]+href="http:\/\/www.dream4.de\/[^>]+>koobi-cms<\/a> ([\d\.]+)/i },

# Version Detection # Powered by text
{ :version=>/<div class="copyright">powered by Koobi CMS ([\d\.]+)/ },

# Version Detection # HTML comment
{ :version=>/    Diese Webseite wurde mit Koobi[\ :]*(SHOP|PRO|CMS)[\ \-]*([\d\.\ a-z]+) erstellt./, :offset=>1 },

# Version Detection # Nulled script by antichat.ru # Powered by text
{ :version=>/powered by <a class="foot" href="http:\/\/www.antichat.ru" target="_blank">Koobi Pro ([\d\.]+) \[nulled by censored! from antichat.ru\]<\/a>/, :string=>"Nulled" },

]

end


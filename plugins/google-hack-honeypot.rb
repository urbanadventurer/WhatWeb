##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "Google-Hack-Honeypot" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-13
version "0.1"
description "Google Hack Honeypot is the reaction to a new type of malicious web traffic: search engine hackers. - homepage: http://ghh.sourceforge.net/"
examples %w|
http://ghh.sourceforge.net/demo/GHH%20-%20PHP%20Ping/php-ping.php
|

# About 184 results @ 2010-06-13
# "Enter ip" inurl:"php-ping.php"

def passive
        m=[]

        if @body =~ /<title>The WorldsEnd.NET - Free Ping Script, written in PHP<\/title><\/head><body bgcolor="#FFFFFF" text="#000000"><\/body><p><font size="2">Your IP is: [\d\.]*<\/font><\/p><form methode="post" action="[\ \/\'\+\-\.a-zA-Z0-9]*">   Enter IP or Host <input type="text" name="host" value="127.0.0.1"><\/input>   Enter Count <input type="text" name="count" size="2" value="4"><\/input>   <input type="submit" name="submit" value="Ping!"><\/input><\/form><br><b><\/b><\/body><\/html>/
                version="PHP-Ping"
                m << {:name=>"default html",:version=>version}
        end

        m
end

end

# an aggressive plugin could look for:
#  xml.inc
#  xmlrpc.inc
#  xmlrpcs.inc
#  ghhserver.php
#  config.php
#  CreateDatabase.sql


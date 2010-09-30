##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "360-Web-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-12
version "0.1"
description "- homepage: http://www.360webmanager.com"
examples %w|
www.360webmanager.com/index.php
www.360web.com.ar/index.php
www.360webnews.com/index.php
www.360webmarketing.com.ar/index.php
www.360webmastertools.net/index.php
www.excedoboats.com/index1.php
www.flybynet.net/index.php
www.ecs.com.ar/index.php
www.fucoreyes.com/index1.php
www.lu.net.ar/index.php
www.clanmacfarlane.com.ar/index1.php
www.materiaurbana.com/index.php
www.jornadasalicaceas.com/index.php
www.flybynet.net/index.php
www.afcp.org.ar/index.php
www.sacryc.com.ar/index.php
wasargentina2011.com/index1.php
www.cultoasanlamuerte.com/index.php
www.kalmada.com.ar/index1.php
|

matches [

# About 36,800 results @ 2010-06-12
{:name=>'GHDB: "powered by 360 Web Manager"',
:certainty=>75,
:ghdb=>'"powered by 360 Web Manager"'
},

# catch redirect pages 
{:name=>'default redirect title',
:certainty=>75,
:regexp=>/360WebManager Software :: administrador contenidos web/
}

]

def passive
        m=[]

        if @body =~ /<div align="center"><span class="copyr">Powered by <a href="http:\/\/www.360webmanager.com" target="_blank" class="copyrlink">360 Web Manager<\/a> [\d\.]+/
                version=@body.scan(/<div align="center"><span class="copyr">Powered by <a href="http:\/\/www.360webmanager.com" target="_blank" class="copyrlink">360 Web Manager<\/a> ([\d\.]+)/)[0][0]
                m << {:name=>"powered by text",:version=>version}
        end

        m
end


end


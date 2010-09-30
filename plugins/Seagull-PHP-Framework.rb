##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Seagull-PHP-Framework" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-12
version "0.1"
description "Seagull is a mature OOP framework for building web, command line and GUI applications. Licensed under BSD, the project allows PHP developers to easily integrate and manage code resources, and build complex applications quickly. - homepage: http://seagullproject.org/"

# 101 results for "Powered By Seagull PHP Framework" @ 2010-09-12
# 34 results for intitle:"Seagull Framework :: Installation" @ 2010-09-12
examples %w|
s12.delirium.wp.pl
s13.delirium.wp.pl
fp.seagullsystems.com
hausamsee.hallstattregion.at
indonesia-property.com
news.picturearchive.co.za
rostok.info/default/
rushlightawards.co.uk
seagullproject.org
www.hotel-hausamsee.at
www.zoopalic.co.rs
www.motorsportentry.com
www.liepa.fi
www.siegwulf-turek.at
www.ol-ut.org
www.carfrom.us
www.picturearchive.co.za/
www.im-salzkammergut.at
www.sandhillspower.net
www.canalettocamperclub.com
www.grupobisel.com/www/
www.heikewycisk.de
www.progenicscorp.com
www.buteni.ro
www.worldphotoalbum.com/index.php
www.bidro.eu/www/setup.php
|

matches [

# Meta generator
{ :text=>'    <meta name="generator" content="Seagull Framework" />' },

# Powered by text
{ :regexp=>/    Powered by <a href="http:\/\/seagullproject.org[\/]*" title="Seagull framework homepage">Seagull PHP Framework<\/a>/ },

# Default javascript
{ :regexp=>/        var SGL_JS_SESSID[\s]*=/ },

# Help link
{ :regexp=>/<link rel="help" href="http:\/\/trac.seagullproject.org[\/]*" title="Seagull Documentation." \/>/ },

# Error page
{ :text=>'    <title>Seagull Framework :: Installation</title>        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />' },

# Default logo
{ :url=>"/themes/default/images/logo.png", :md5=>"4986dcbd7b531e29c58b5808b1f8cdd3" },

]

# Passive version detection using powered by text
def passive
        m=[]

        if @body =~ /    Powered by <a href="http:\/\/seagullproject.org" title="Seagull PHP Framework">Seagull PHP Framework<\/a> v([\d\.]+)/
                version=@body.scan(/    Powered by <a href="http:\/\/seagullproject.org[\/]*" title="Seagull PHP Framework">Seagull PHP Framework<\/a> v([\d\.]+)/)[0][0]
                m << {:version=>version}
        end

        m

end


end


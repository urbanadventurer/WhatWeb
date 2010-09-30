##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PHP-Shell" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-06
version "0.1"
description "php remote shell and file explorer"
examples %w|
www.raveneye1.com/1.php
www.s-solution.sk/honey/filemanager/1.php
www.amorphias.com/mc.php
www.nwo.net/hh/1.php
www.abyss.cba.pl/hnpt/haxplorer/1.php
www.island.net/~zapper/cgi.php
|

matches [

# http://johnny.ihackstuff.com/ghdb/?function=detail&id=833
# About 48 results @ 2010-06-06
{:name=>'GHDB: +filetype:php +HAXPLORER +"Server Files Browser" +Browsing +"Script Location"',
:certainty=>75,
:ghdb=>'+filetype:php +HAXPLORER +"Server Files Browser" +Browsing +"Script Location"'
}

]

def passive
        m=[]

        if @body =~ /PHPShell by [a-zA-Z0-9]+ - Version/
                        v=@body.scan(/PHPShell by [a-zA-Z0-9]+ - Version ([0-9a-z\.]+)/)[0].to_s
                        m << {:name=>"footer html", :version=>v }
        end
        m
end

end


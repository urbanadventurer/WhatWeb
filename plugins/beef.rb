##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


Plugin.define "BeEF" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-04
version "0.1"
description "BeEF - Browser Exploitation Framework - homepage: http://www.bindshell.net/tools/beef/"
examples %w|
stage3i.free.fr/ui/
showcase1.se/sosse/beef/ui/
|

matches [
{:name=>"default logo", :text=>'<img src="../images/beef.gif" onclick="new Effect.Shake(\'sidebar\');"></div> BeEF</h1>'
}


]

end


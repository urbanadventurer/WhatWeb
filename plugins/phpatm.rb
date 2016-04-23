##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpATM" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-22
version "0.1"
description "phpATM (PHP Advanced Transfer Manager) is a free, open source, PHP based Upload and Download manager. But unlike most other of its kind it stores the data in flat text files and therefore does not require a database like MySQL installed on the web server."
website "http://phpatm.org/"

# 304 for "Powered by phpATM"
# 91 for "Powered by phpATM" inurl:"viewer_bottom.php"

# Dorks #
dorks [
'"Powered by phpATM" inurl:"viewer_bottom.php"'
]



# Matches #
matches [

# Frameserv
{ :text=>'<frame name="viewer_bottom" src="viewer_bottom.php?file=' },

# Version Detection # Powered by footer
{ :version=>/<div id="phpatm">(<br>)?<a href="http:\/\/phpatm\.org\/" target="_blank" title="Powered by PHP Advanced Transfer Manager v([^"]+)">Powered by phpATM<\/a><br><\/div>/, :offset=>1 },

]

end



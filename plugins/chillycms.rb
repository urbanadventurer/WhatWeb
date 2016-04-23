##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "chillyCMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-08
version "0.1"
description "chillyCMS is a Content Management System. This is a software which allows you to create a website without any programming skills."
website "http://chillycms.bplaced.net/"

# 8 results for "powered by chillyCMS" @ 2010-09-08
# 5 results for inurl:chillyCMS/core/show.site.php @ 2010-09-08

# Dorks #
dorks [
'inurl:chillyCMS/core/show.site.php',
'"powered by chillyCMS"'
]



matches [

# Default URL structure
#{ :ghdb=>'inurl:/chillyCMS/core/show.site.php' },

# Powered by text
{ :text=>'	powered by <a href="http://FrozenPepper.de">chillyCMS</a>.' },
{ :text=>'	<p>&copy;2010 <a href="">demo.opensourcecms.com</a>,' },
{ :text=>'	<p>&copy;2010 <a href="">chillycms.bplaced.net</a>,' },

]

end


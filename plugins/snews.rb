##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "sNews" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-14
version "0.1"
description "sNews is a completely free, standards compliant, PHP and MySQL driven Content Management System."
website "http://www.snewscms.com/"

# Google results as at 2010-10-14 #
# 326 for "powered by sNews"

# Dorks #
dorks [
'"powered by sNews"'
]



matches [

# Powered by text
{ :text=>'<p>This site is powered by <a href="http://snewscms.com/" title="sNews CMS" onclick="target=\'_blank\';">sNews</a>' },
{ :text=>'powered by <a href="http://www.solucija.com/home/snews/" title="sNews">sNews</a>' },
{ :text=>'Powered by <a href="http://snews.solucija.com" title="Single file CSS and XHTML valid CMS">sNews</a>' },
{ :text=>'Powered by <a href="http://snewscms.com/" title="Single file CMS">sNews</a>' },

# Meta description
{ :text=>'<meta name="description" content="sNews CMS" />', :certainty=>75 },

# Login page # /login/ or admin.php # Default form HTML
{ :text=>'<p><label for="uname">Username</label>:<br /><input type="text" name="uname" id="uname" class="text" value="" /></p><p><label for="pass">Password</label>:<br /><input type="password" name="pass" id="pass" class="text" value="" /></p>' },

# Version detection # Meta generator
{ :version=>/<meta name="Generator" content="sNews ([\d\.]+)" \/>/ },

]

end


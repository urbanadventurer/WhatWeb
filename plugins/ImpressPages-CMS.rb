##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ImpressPages-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-10-22
version "0.1"
description "ImpressPages - Web CMS built on PHP5.3 and MySQL"
website "http://www.impresspages.org/"

# Google results as at 2011-10-22 #
# 303 for "Powered by ImpressPages CMS."
#  95 for "This is standard ImpressPages content management system website. Use it as an example to build your own website with your content and design." intitle:"ImpressPages welcome page"
#  19 for inurl:"admin.php" intitle:"ImpressPages" +Copyright

# Dorks #
dorks [
'"Powered by ImpressPages CMS."',
'"This is standard ImpressPages content management system website. Use it as an example to build your own website with your content and design." intitle:"ImpressPages welcome page"'
]



# Matches #
matches [

# /favicon.ico
{ :url=>"/favicon.ico", :md5=>"c92e16f66ec6069432c3be3d10bf5d1c" },

# Powered by link
{ :text=>'Powered by <a href="http://www.impresspages.org">ImpressPages CMS</a>' },

# Fresh Install # Welcome Page # h1 class="ipWidgetTitleHeading"
{ :text=>'<h1 class="ipWidgetTitleHeading">ImpressPages CMS successfully installed</h1>' },

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="ImpressPages CMS ([^\s]+) under GNU GPL license"( \/)?>/ },

# HTML Comment
{ :text=>'<!-- common functions used by various modules -->' },

# Admin Page # Frame busting JavaScript
{ :text=>'<script type="text/javascript">if(parent.header && parent.content)parent.window.top.location=\'admin.php\';</script>' },

# span id="modCommunityNewsletterError"
{ :text=>'<span id="modCommunityNewsletterError" class="error">Incorrect e-mail address</span>' },
]

end


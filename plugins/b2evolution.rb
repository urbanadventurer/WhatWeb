##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "b2evolution" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-11
version "0.1"
description "b2evolution is a powerful blog tool you can install on your own website. - homepage: http://b2evolution.net/"

# 482 results for "Powered by b2evolution" @ 2010-10-11
examples %w|
b2evolution.net/admin.php
demo1.b2evolution.net/stable/admin.php
demo1.b2evolution.net/stable/blog1.php
demo1.b2evolution.net/stable/blog2.php
demo1.b2evolution.net/stable/blog3.php
demo1.b2evolution.net/stable/default.php
b2evo.sonorth.com
b2evo.sonorth.com/admin.php
ezelesek.com/b2evolution/admin.php
ezelesek.com/b2evolution/
mayanhawk.com/news/
mayanhawk.com/news/admin.php
skinfaktory.com
skinfaktory.com/admin.php
www.blog.hemminga.net
www.blog.hemminga.net/admin.php
www.larrate.com
www.larrate.com/admin.php
www.leeturner.org
www.leeturner.org/admin.php
|

matches [

# Default image HTML
{ :regexp=>/rsc\/img\/powered-by-b2evolution-150t.gif" alt="Powered by b2evolution"/i },

# Version detection # Login page
{ :version=>/<p class="footer"><a href="http:\/\/b2evolution.net\/" title="visit b2evolution's website"><strong>b2evolution ([^<]+)<\/strong><\/a>/ },

# Version detection # Meta generator
{ :version=>/<meta name="generator" content="b2evolution ([^\"]+)" \/>/ },

# Powered by text
{ :regexp=>/Powered by <a href="http:\/\/b2evolution.net[\/]*"[^>]+>b2evolution<\/a>/ },

]

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PivotX" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-05-18
version "0.1"
description "PivotX - blog software"
website "http://pivotx.net/"

# Google results as at 2012-05-18 #
# 131 for inurl:"pivotx/ajaxhelper.php"

# Dorks #
dorks [
'inurl:"pivotx/ajaxhelper.php"'
]



# Matches #
matches [

# Login Page # HTML Comment
{ :text=>'<!-- PivotX -->' },

# Login Page # JavaScript
{ :text=>'<script src="includes/js/pivotx.js" type="text/javascript"></script>' },

# Login Page # Logo HTML
{ :text=>'<img src="templates_internal/assets/pivotx.png" alt="PivotX" /></a>' },

# Login Page # Footer # Version Detection
{ :version=>/<em>PivotX - ([^<]+)<\/em> &nbsp; - &nbsp; &copy; 20[\d]{2}/ },

# Meta Generator
{ :text=>'<meta name="generator" content="PivotX" />' },

# Meta Generator + HTML Comment # Version Detection
{ :version=>/<meta name="generator" content="PivotX" \/><!-- version: PivotX - ([^\s]+) -->/ },

]

end


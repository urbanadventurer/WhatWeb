##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Oracle-ADF-Faces" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-02-12
version "0.1"
description "Oracle ADF Faces Components is a set of over a 150 Ajax-enabled JSF components that let you build a richer Web user interface for Java EE applications."
website "http://www.oracle.com/technetwork/developer-tools/adf/overview/index-092391.html"

# Google results as at 2012-02-12 #
# 215 for "This page uses JavaScript and requires a JavaScript enabled browser.Your browser is not JavaScript enabled."

# Dorks #
dorks [
'"This page uses JavaScript and requires a JavaScript enabled browser.Your browser is not JavaScript enabled."'
]



# Matches #
matches [

# HTML Comment # Version Detection
{ :version=>/<!-- Created by Oracle ADF Faces \((Version mismatch: )?ADF Faces API - ([\d_]+)\/ADF Faces Implementation - ([\d_]+)\), skin:([^-]+) -->/, :offset=>1 },

# HTML Comment # Version Detection
{ :version=>/<!-- Created by Oracle ADF Faces \((Version mismatch: )?ADF Faces API - ([\d_]+)\/ADF Faces Implementation - ([\d_]+)\), skin:([^-]+) -->/, :offset=>2 },

# HTML Comment # Skin Detection
{ :string=>/<!-- Created by Oracle ADF Faces \((Version mismatch: )?ADF Faces API - ([\d_]+)\/ADF Faces Implementation - ([\d_]+)\), skin:([^-]+) -->/, :offset=>3 },

# Meta Generator
{ :text=>'<meta name="generator" content="Oracle ADF Faces">' },

# Login Page # JavaScript
{ :text=>"<script>var _AdfWindowOpenError='A popup window blocker has been detected in your browser. Popup blockers interfere with the operation of this application. Please disable your popup blocker or allow popups from this site.';</script>" },

]

end


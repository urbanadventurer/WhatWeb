##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-24 #
# Updated version detection
##
Plugin.define "Pc4Uploader" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-17
version "0.2"
description "File upload web app"
website "http://www.pc4arb.com/"

# Google results as at 2010-09-17 #
# 266 results for "powered by Pc4Uploader"

# Dorks #
dorks [
'"powered by Pc4Uploader"'
]



# Matches #
matches [

# Default javascript in version 10.x
{ :text=>'eval("page" + id + " = window.open(URL, \'" + id + "\', \'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=650,height=400,left = 199.5,top = 196.5\');");', :version=>"10.x" },

# Version Detection # Version 9
{ :version=>/Pc4Uploader <font color="#000080"> <b>v([\d\.]+)<\/b><\/font>/ },

# Version Detection # Pro # Version 9
{ :version=>/Pc4Uploader <font color="#000080"> <b>v([\d\.]+) Pro<\/b><\/font>/, :string=>"Pro" },

# Version Detection # Powered by text
{ :version=>/<p id="legal" style="text-align: center">Powered by Pc4Uploader v<span lang="en-us">([\d\.]+)<\/span><\/p>/ },

# Version Detection # Version 10
{ :version=>/Powered by Pc4Uploader <b>v([\d\.]+)<\/b>&nbsp; Copyright <b>/ },

# Version Detection # Pro # Version 10
{ :version=>/Powered by Pc4Uploader <b>v([\d\.]+) Pro<\/b>&nbsp; Copyright <b>/, :string=>"Pro" },

]

end


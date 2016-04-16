##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Constructr-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "ConstructrCMS is a new and fresh Content Management System build with the Power of PHP and MySQL. The Backend is mostly controlled by Ajax for a unique User Experience."
website "http://www.constructr-cms.org/"



# Matches #
matches [

# Error page
{ :text=>'<html><head><title>Constructr CMS</title><body><p>Sorry, no Workspace-Template found!</p><p>Visit <a href="http://constructr.phaziz.com">http://constructr.phaziz.com</a> for further Information.</p></body></head>' },

# Developed by link
{ :text=>'<br /><br />Constructr CMS - developed by <a href="http://phaziz.com/constructr-cms/" onclick="window.open(this.href);return false;">phaziz interface design</a>' },

]

end



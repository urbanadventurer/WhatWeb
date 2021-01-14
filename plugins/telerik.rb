##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Telerik UI"
authors [
  "Chad Brigance @ChadBrigance" # 2021-01-13
]
version "0.1"
description "Telerik is a framework for creating user interfaces"
website "http://www.telerik.com"

matches [

# Telerik_stylesheet
{ :text=>'type="text/css" rel="stylesheet" class="Telerik_stylesheet" />' },

# Telerik.Web.UI.RadListView, RadAjaxManager, and other Rad*
{ :regexp=>/\$create\(Telerik\.Web\.UI\.Rad[a-zA-Z]+,/ },

# Telerik.Web.UI.WebResource.axd - in older versions it was just WebResource.axd
{ :regexp=>/(src|href)="\/(Telerik.Web.UI.)?WebResource.axd\?/ },

# Version detection, for a later version.  This is not accurate unless it's done only in aggressive mode
#{ :version=>/(20[0-9]{2}\.[0-9]+\.[0-9]+\.[0-9]+)/ },

# Verification using a known endpoint that produces a known response
{ :url=>'/Telerik.Web.UI.WebResource.axd?type=rau', :text=>'{ "message" : "RadAsyncUpload handler is registered succesfully, however, it may not be accessed directly." }', },

]

end

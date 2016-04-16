##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Web-Wiz-Rich-Text-Editor" do
author "Brendan Coles <bcoles@gmail.com>" # 2013-04-01
version "0.1"
description "Web Wiz Rich Text Editor"
website "http://www.richtexteditor.org/"

# Google results as at 2013-04-01 #
# 40 for inurl:"RTE_popup_file_atch.asp" ext:asp

# Dorks #
dorks [
'inurl:"RTE_popup_file_atch.asp" ext:asp'
]



# Matches #
matches [

# RTE_popup_file_atch.asp # Footer # Version Detection
{ :version=>/<a href="http:\/\/www\.richtexteditor\.org" target="_blank" style="font-size:10px">Web Wiz Rich Text Editor<\/a> version ([^<]+)<\/span><\/td>/ },

# RTE_popup_file_atch.asp # HTML Comment # Version Detection
{ :version=>/<\!\-\-\/\/\s+\/\* [^\s]+\s+Software: Web Wiz Rich Text Editor\(TM\) ver\. ([^\s]+)/ },

# Form tag
{ :text=>'<form method="post" action="RTE_popup_file_atch.asp" name="frmImageInsrt">' },

]

end


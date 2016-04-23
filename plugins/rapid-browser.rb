##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RAPID-Browser" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "RAPID Browser - Managing news contents, sharing editorial and publishing to paper, web and mobile."
website "http://www.knowledgeview.co.uk/solutions/rapidbrowser"

# ShodanHQ results as at 2011-06-02 #
# 4 for WebLoginCmd
# 4 for command command_name view -Ksscommands

# Google results as at 2011-06-02 #
# 1 for intitle:"Welcome to Rapid Browser"

# Dorks #
dorks [
'intitle:"Welcome to Rapid Browser"'
]



# Matches #
matches [

# Version Detection # Title
{ :version=>/<title>Welcome to Rapid Browser ([\d\.]+)<\/title>/ },

# HTML Comment
{ :text=>'<!-- ### Bullet table ### -->' },

# images/copy_line.gif HTML
{ :text=>'<td rowspan="3" valign="top" bgcolor="#FF6600"><img src="images/copy_line.gif" width="175" height="80" alt="Real time news browser that lets you share and publish" border="0"></td>' },

# Login Image
{ :text=>'<td align="right" valign="top"><input type="image" name="login" src="images/login_button.gif" alt="Login to Rapid Browser"></td>' },

# Version Detection # Stylesheet
{ :version=>/<link rel="stylesheet" type="text\/css" href="styles\/typeStyle-en.css\?([^"]+)">/ },

]

# Passive #
def passive
	m=[]

	# Location HTTP Header
	m << { :name=>"Location HTTP Header" } if @headers["location"] =~ /command\?command_name=WebLoginCmd&view=login\.jsp$/

	# Return passive matches
	m
end

end


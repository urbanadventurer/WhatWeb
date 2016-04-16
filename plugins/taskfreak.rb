##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-25 #
# Updated version detection
##
Plugin.define "TaskFreak" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.2"
description "TaskFreak! Original is a simple but efficient web based task manager written in PHP."
website "http://www.taskfreak.com/original/"



# Matches #
matches [

# Version Detection # Powered by text
{ :version=>/<br>Powered by <a href="http:\/\/www.taskfreak.com">TaskFreak <\/a> v([\d\.]+) - Released on [\d\-]+ under GNU General Public License/ },

# Version Detection # Powered by text
{ :version=>/    <a href="http:\/\/www.taskfreak.com">TaskFreak! multi user<\/a> v([\d\.]+) - Released on [\d\-]+ under GNU General Public License/ },

]

end


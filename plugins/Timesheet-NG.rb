##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Timesheet-NG" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-11-08
version "0.1"
description "Timesheet NG is a free Open Source online time tracking application. Focusing on ease of use, Timesheet NG allows multiple employees and contractors to track and log their time spent on multiple projects."
website "http://www.timesheetng.org/"

# 13 for "Username" "Timesheet Login" inurl:login ext:php

# Dorks #
dorks [
'"Username" "Timesheet Login" inurl:login ext:php'
]



matches [

# Default form spacer image hash
{ :md5=>"df3e567d6f16d040326c7a0ea29a4f41", :url=>"images/spacer.gif" },

# HTML Comment
{ :text=>"<!-- include the timesheet face up until the heading start section -->" },

# Default Form HTML
{ :text=>'<td><img class="login_image" src="images/spacer.gif"></td>' },

# Default meta description
{ :text=>'<META name="description" content="Timesheet Next Gen">' },

]

end


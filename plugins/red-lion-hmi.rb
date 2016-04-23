##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Red-Lion-HMI" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-17
version "0.1"
description "Red Lion's G3 operator interface panels give you complete HMI (Human Machine Interface) functionality for PLCs, motor drives and other communications-capable devices. With Ethernet as standard on all G3 models, you can network-enable any serial devices connected to the panel."
website "http://www.redlion.net/"

# Google results as at 2011-05-17 #
# 2 for "Powered by Red Lion." "Display a view of the HMI's display and keyboard."

# Dorks #
dorks [
'"Powered by Red Lion." "Display a view of the HMI\'s display and keyboard."'
]



# Matches #
matches [

# Display menu option
{ :text=>'<td><font face=tahoma size="2">Display a view of the HMI\'s display and keyboard.&nbsp;&nbsp;&nbsp;</font></td>' },

# Powered by text
{ :text=>'<p><font face=tahoma size=1>Powered by <a href=http://www.redlion.net>Red Lion</a>.</font></p>' },

]

end



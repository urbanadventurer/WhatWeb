##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

Plugin.define "SEH-KYOCERA-PrintServer" do
author "Andrew Horton"
version "0.1"
description "A complete print server provided as an interface card for attaching KYOCERA printers and multifunctional peripherals (MFP) to the network"
website "http://www.seh-technology.com/products/print-servers/printer-interfaces/kyocera.html"



# 2 for "SEH Computertechnik GmbH, Germany" "All trademarks, registered trademarks, logos and product names are property of their respective owners"

# Dorks #
dorks [
'"SEH Computertechnik GmbH, Germany" "All trademarks, registered trademarks, logos and product names are property of their respective owners"'
]

matches [
{:name=>"HTML start",
:regexp=>/<HTML><HEAD>[\s]*<META HTTP-EQUIV="Content-Type" CONTENT="text\/html; CHARSET=UTF-8">[\s]*<TITLE>Print server homepage<\/TITLE>[\s]*<\/HEAD>[\s]*<FRAMESET COLS="200/},

{:url=>'/status/general_en.html', :model=>/<TR><TD> Print server model<TD> ([^<]*)/},
{:url=>'/status/general_en.html', :version=>/<TR><TD> Software version<TD> ([^<]*)/},
{:url=>'/status/general_en.html', :string=>/<TR><TD> Default print server name<TD> ([^<]*)/}

]

end


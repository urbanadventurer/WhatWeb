##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmarterMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "SmarterMail delivers Exchange-level email server software features for a fraction of the cost. With lower hardware requirements, superior stability and reduced maintenance costs, SmarterMail has significantly lower Total Cost of Ownership (TCO) and is the best-in-class Microsoft Exchange alternative for businesses and hosting companies."
website "http://www.smartertools.com/smartermail/mail-server-software.aspx"

# Google results as at 2011-03-14 #
# 326 for intitle:"SmarterMail Login SmarterMail" "Remember me" "SmarterMail Enterprise"|"SmarterMail Professional"|"SmarterMail Free"



# Matches #
matches [

# Product Detection # Vendor Link # >= 4.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>SmarterMail (Enterprise|Professional|Free|FREE) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>(Windows Mail Server|Email Server Software|Mail Server Software)<\/a>/ },

# Verson Detection # Vendor Link # >= 4.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>SmarterMail (Enterprise|Professional|Free|FREE) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>(Windows Mail Server|Email Server Software|Mail Server Software)<\/a>/, :offset=>1 },

# Product Detection # td bar1inner # <= 3.x
{ :string=>/										<td class="?bar1inner"?>SmarterMail (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/ },

# Version Detection # td bar1inner # <= 3.x
{ :version=>/										<td class="?bar1inner"?>SmarterMail (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/, :offset=>1 },

# Title
{ :text=>"<title>Login - SmarterMail</title>" },

]

end



##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "VSP-Stats-Processor" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "vsp stats processor is a multi game log analyzer / stats generator / log parser."
website "http://www.scivox.net/vsp/"



# Matches #
matches [

# Powered by link
{ :regexp=>/powered by <A HREF="http:\/\/www.(scivox.net|clanavl.com)\/vsp\/">vsp stats processor<\/A>/ },

# Theme: bismarck
{ :text=>'&nbsp;theme:bismarck by <A HREF="#" TITLE="myrddin8 <AT> gmail <DOT> com">myrddin</A>&nbsp;', :string=>"bismarck" },

# Title
{ :certainty=>25, :regexp=>/<TITLE>vsp \((map|award|game|player) stats\)<\/TITLE>/ },

# Misconfigured # Database Error
{ :certainty=>25, :text=>"<BODY>error: cannot establish database connection or database database_name does not exist", :string=>"Error" },

# Version Detection
{ :version=>/<A HREF="http:\/\/www.clanavl.com\/vsp\/">vsp<\/A> v([\d\.]+),/ },

]

end



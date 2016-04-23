##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-21 #
# Updated version detection
##
Plugin.define "phpQuestionnaire" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-21
version "0.2"
description "phpQuestionnaire"
website "http://www.chumpsoft.com/products/phpq/"

# Google results as at 2010-08-21 #
# 56 for "powered by phpQuestionnaire"

# Dorks #
dorks [
'"powered by phpQuestionnaire"'
]



# Matches #
matches [

# Survey list page
{ :text=>'<tr><td></td><td colspan="2"><h2>Survey List</h2></td></tr>' },
{ :text=>'	<tr><td colspan="2"><hr size="1" noshade /></td></tr><tr><td colspan="2">Currently no available surveys.</td></tr>	</table>' },

# CSS
{ :text=>'   TEXTAREA      { font-family: verdana,arial,helvetica; font-size: 12px; width: 400px; height: 60px; }' },
{ :text=>'   TEXTAREA      { font-family: verdana,arial,helvetica; font-size: 10px; width: 400px; height: 60px; }' },

# powered by text
{ :text=>'			<td align="right">powered by <a href="http://www.chumpsoft.com">phpQuestionnaire</a></td>' },
{ :text=>'			<td align="right">powered by phpQuestionnaire</td>' },

# default logo
{ :md5=>'feae34c62729c85af0b4114bd02d634a', :url=>'templates/default/images/logo.gif' },

# Version Detection # default link HTML
{ :version=>/      <TD ALIGN=right><NOBR><B><A HREF="http:\/\/www.chumpsoft.com\/products\/phpq\/" class=link>phpQuestionnaire<\/A> ([\d\.]+) &copy [0-9]{4}-[0-9]{4}/ },

]

end


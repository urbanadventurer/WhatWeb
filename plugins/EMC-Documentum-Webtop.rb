##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "EMC-Documentum-Webtop" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-07-14
version "0.1"
description "EMC Documentum Webtop is a browser-based interface that provides access to the EMC Documentum repository and content management services."
website "http://www.emc.com/products/detail/software2/webtop.htm"

# 40 for "Login Name" Repository Webtop intitle:login
# 21 for "Login Name" Repository Webtop intitle:login inurl:component

# Dorks #
dorks [
'"Login Name" Repository Webtop intitle:login inurl:component'
]



# Matches #
matches [

# body
{ :certainty=>75, :text=>"<body  marginwidth='0' topmargin='40' bottommargin='0' class='contentBackground' leftmargin='0' rightmargin='0' marginheight='40'>" },

# select name='Login_docbase_0'
{ :text=>"<select name='Login_docbase_0' id='DocbaseName' title=\"Repository\" size='0' class=defaultDropdownListStyle onchange='setKeys(event);" },

# Repository span
{ :text=>'<td scope="row" align=\'right\' class="fieldlabel" height="30"><span  class=\'defaultLabelStyle\'>Repository</span></td><td class="defaultcolumnspacer">:&nbsp;</td>' },

# td nowrap class="logintitletext"
{ :text=>'<td nowrap class="logintitletext" height="23" valign="top"><span  class=\'dialogTitle\'>Webtop Login' },

# JavaScript g_virtualRoot
{ :text=>'<script type="text/javascript">var g_virtualRoot = "/webtop";</script>' },

# input name='MyLogin_username_0'
{ :text=>"<td><input type='text' name='MyLogin_username_0' id='LoginUsername' title=\"Login Name\" size='40' onkeypress=\"handleKeyPress(event)\"></td>" },

# Redirect Page # body onload
{ :regexp=>/<script type="text\/javascript" src='\/webtop\/index\.js'><\/script>[\s]+<\/head>[\s]+<body onload='doRedirect\("\/component\/main"\)'>[\s]+<\/body>[\s]+<\/html>/ },

# Version Detection
{ :version=>/<div id="logo"><span  class='defaultLabelStyle'>Webtop<\/span>[\s]?&nbsp;<span  class='dialogTitleVersion'>([^<]+)<\/span>/ },

]

end


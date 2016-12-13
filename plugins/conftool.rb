##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ConfTool" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-24
version "0.1"
description "ConfTool is a Web-based event management system that was developed to support the organization of conferences, workshops, congresses and seminars. - Hompage: http://www.conftool.net/"

# Google results as at 2011-06-24 #
# 72 for "ConfTool Conference Administration" "User name or e-mail"

# Dorks #
dorks [
'"ConfTool Conference Administration" "User name or e-mail"'
]



# Matches #
matches [

# h2 heading
{ :text=>'<h2 align=center>ConfTool Conference Administration</h2>' },

# Username input # Standard Edition
{ :string=>"Standard", :text=>'<td class="td_dlg_input" width=67% align=left><input type=text name=\'ctusername\' tabindex=2 size=35></td></tr>' },

# Version Detection # Pro Edition
{ :string=>"Pro", :version=>/<td align="right" nowrap><a href="http:\/\/www\.conftool\.net\/"><span class="[^"]+">Conference Software - <\/span><span class="[^"]+">[\s]+(VSIS )?ConfTool( Pro)? ([^<^\s]+)<\/span><\/a><BR>/, :offset=>2 },

# Version Detection # Standard Edition
{ :string=>"Standard", :version=>/<td align="right" nowrap><span class="normal8"><a href='http:\/\/www\.conftool\.net'>(Conference |Web-based |Event |Abstract )?(Management|Conference) (Software|System) - VSIS <b>ConfTool<\/b><\/a> Standard ([^<^\s]+)<\/span><BR>/, :offset=>3 },

]

end


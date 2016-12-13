##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-17 # Andrew Horton
# Added website parameter
##
Plugin.define "AMX-Mod-X" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.2"
description "AMX Mod X is a versatile Half-Life metamod plugin which is targetted toward server administration."
website "http://www.amxmodx.org/"
# Dorks #
dorks [
'ext:cfg "Linux users may encounter problems if they specify"'
]

# 4 results for ext:cfg "Linux users may encounter problems if they specify" @ 2010-09-04


# Matches #
matches [

{ :text=>'// *NOTE* amx_sql_type specifies the DEFAULT database type which admin.sma will use.' },

]

# Grab mySQL username, server and database details
def passive
	m=[]

	if @body =~ /amx_sql_host[\s]+"([^\"]*)"/ and @body =~ /amx_sql_user[\s]+"([^\"]+)"/ and @body =~ /amx_sql_pass[\s]+"([^\"]*)"/
                version=@body.scan(/amx_sql_user[\s]+"([^\"]+)"/)[0][0] + ":" + @body.scan(/amx_sql_pass[\s]+"([^\"]*)"/)[0][0] + "@" + @body.scan(/amx_sql_host[\s]+"([^\"]+)"/)[0][0]
                m << {:version=>version}
        end

        m

end


end


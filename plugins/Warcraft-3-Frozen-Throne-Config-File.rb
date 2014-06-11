##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Warcraft-3-Frozen-Throne-Mod-Config-File" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "The Warcraft 3 mod for AMX-Mod-X for Half-Life uses a config file which contains mySQL username, password, server, database name, table name. This plugin grabs the mySQL username, password and server."

# 4 results for inurl:war3ft.cfg ext:cfg @ 2010-09-04


matches [

{ :text=>'// Radius to give XP to teammates near where the special objective is completed (rescued hosties, bomb planted, killed vip, vip escaped, default is 750)' },

]

# Grab mySQL username, server and database details
def passive
        m=[]

        if @body =~ /wc3_sql_dbhost		"([^\"]+)"/ and @body =~ /wc3_sql_dbuser		"([^\"]+)"/ and @body =~ /wc3_sql_dbpass		"([^\"]*)"/
                version=@body.scan(/wc3_sql_dbuser		"([^\"]+)"/)[0][0] + ":" + @body.scan(/wc3_sql_dbpass		"([^\"]*)"/)[0][0] + "@" + @body.scan(/wc3_sql_dbhost		"([^\"]+)"/)[0][0]
                m << {:version=>version}
        end

        m

end


end


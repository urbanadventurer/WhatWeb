##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "mySQL-Error" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.1"
description "This plugin detects mySQL errors and grabs the username, server and database details."
# mySQL-Error.rb plugin replaces the mySQLSntaxError and mySQL-Connect-Error plugins in WhatWeb version 0.4.5

# 318 results for mySQL "Error: Access denied for user" "using password: YES"|"using password: NO"|"to database" @ 2010-08-28
# 304 results results for Warning mysql_connect "function.mysql-connect" "Access denied for user" @ 2010-08-28
# 162 results for "Warning: mysql_connect" "function.mysql-connect" "Lost connection to MySQL server at 'reading initial communication packet'" +ext:php @ 2010-08-10
examples %w|
asiatopwebsites.hitsmojo.com
dr-alkaldi.com
platiniumhits.com/links/
www.apnaspace.com
www.trendybean.com
www.ses71.com
www.tayreece.com
www.winiz.de
www.norfoxx.com
www.telnex.com/trouble/customerview/
www.breastsvision.com
www.ics2008.org
www.iconoscomunicadores.info/guestbooks/
www.pro-starter.com
www.lacollesurloup.org/gallery2/
www.nuovoblog.com
www.itrafficboost.com
www.tdc.govt.nz/index.php?TasmansFutureDiscussionPaper
www.nzhotpools.co.nz/hot-pools/tarawera-hotsprings 
www.jungunternehmer-hp.de/php/news_show.php
www.franchise-for-sale.com/about.php
www.uni-math.gwdg.de/skripte/shop/Frameset/top.php
www.matteoiammarrone.com/public/s-cms/admin/admin.php
|

matches [

# Syntax Error # Match taken from the mySQLSyntaxError plugin by Caleb Anderson
{ :regexp=>/You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '|You have an error in your SQL syntax near '/ },

# mysql_connect[Connection failed] # Plain text # Italian
{ :text=>"Connessione non riuscita: Can't connect to local MySQL server through socket " },

# mysql_connect[Connection failed] # HTML # English
{ :text=>"<b>Warning</b>:  mysql_connect() [<a href='function.mysql-connect'>function.mysql-connect</a>]: Can't connect to local MySQL server through socket" },

# mysql_connect[Lost connection] # Plain text # English
{ :text=>"Warning: mysql_connect() [function.mysql-connect]: Lost connection to MySQL server at 'reading initial communication packet', " },

# mysql_connect[Lost connection] # HTML # English
{ :text=>"<b>Warning</b>:  mysql_connect() [<a href='function.mysql-connect'>function.mysql-connect</a>]: Lost connection to MySQL server at 'reading initial communication packet', " },

]

# Grab mySQL username, server and database details
def passive
        m=[]

        # mysql_connect[Access denied] # English # HTML
	if @body =~ /<b>Warning<\/b>:  mysql_connect\(\) \[<a href='function.mysql-connect'>function.mysql-connect<\/a>\]: Access denied for user ([^\ ]+)/
                version=@body.scan(/<b>Warning<\/b>:  mysql_connect\(\) \[<a href='function.mysql-connect'>function.mysql-connect<\/a>\]: Access denied for user ([^\ ]+)/)[0][0]
                m << {:version=>version}
        end

	# mysql_query[Access denied] # English # HTML
	if @body =~ /<b>Warning<\/b>:  mysql_query\(\) \[<a href='function.mysql-query'>function.mysql-query<\/a>\]: Access denied for user ([^\ ]+)/
		version=@body.scan(/<b>Warning<\/b>:  mysql_query\(\) \[<a href='function.mysql-query'>function.mysql-query<\/a>\]: Access denied for user ([^\ ]+)/)[0][0]
		m << {:version=>version}
	end

	# mysql_connect[Access denied] # English # Plain text
	if @body =~ /Error: Access denied for user ([^\ ]+) to database ([^\ ]+)/
		version=@body.scan(/Error: Access denied for user ([^\ ]+) to database ([^\ ]+)/)[0][0]+" "+@body.scan(/Error: Access denied for user ([^\ ]+) to database ([^\s]+)/)[0][1]
		m << {:version=>version}
	end

	# mysql_connect[Connection failed] # English # Plain text
	if @body =~ /Error: Connection to mySQL-database at ([^\ ]+) failed!/
		version=@body.scan(/Error: Connection to mySQL-database at ([^\ ]+) failed!/)[0][0]
		m << {:version=>version}
	end

	# mysql_connect[Lost connection] # Italian # Plain text
	if @body =~ /Errore: Non riesco a connettermi al server MySql ([a-z0-9\.\-\_]+)/
		version=@body.scan(/Errore: Non riesco a connettermi al server MySql ([a-z0-9\.\-\_]+)/)[0][0]
		m << {:string=>version}
	end

	# mysql_connect[Lost connection] # Italian # Plain text
	if @body =~ /Errore: Non riesco a selezionare il database ([a-z0-9\.\-\_]+)/
		version=@body.scan(/Errore: Non riesco a selezionare il database ([a-z0-9\.\-\_]+)/)[0][0]
		m << {:string=>version}
	end

        m

end


end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-03-06 #
# Updated regex
##
Plugin.define "mySQL-Error" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-09-04
version "0.2"
description "This plugin detects mySQL errors and grabs the username, server and database details."

# Googleresults as at 2010-08-28 #
# 318 for mySQL "Error: Access denied for user" "using password: YES"|"using password: NO"|"to database"
# 304 for Warning mysql_connect "function.mysql-connect" "Access denied for user"
# 162 for "Warning: mysql_connect" "function.mysql-connect" "Lost connection to MySQL server at 'reading initial communication packet'" +ext:php

# Examples #
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
expertdollar.com/ima/ranking.php
mt.sysmt.com/service_online.php
www.highenergygraphics.com/hienergy.php
mvhighpoint.com/resumen.php
www.eastafricanhomepage.com/index.php
www.frutiroselandia.com.br/galeria/janela.php
www.southeastlandmark.com/land.php
www.txt-clan.com/l4dstatssmx/search.php
www.tdc.govt.nz/index.php?TasmansFutureDiscussionPaper
www.nzhotpools.co.nz/hot-pools/tarawera-hotsprings 
www.jungunternehmer-hp.de/php/news_show.php
www.franchise-for-sale.com/about.php
www.uni-math.gwdg.de/skripte/shop/Frameset/top.php
www.matteoiammarrone.com/public/s-cms/admin/admin.php
|

# Matches #
matches [

# Syntax Error # Match taken from the mySQLSyntaxError plugin by Caleb Anderson
{ :regexp=>/You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '|You have an error in your SQL syntax near '/, :certainty=>25 },

# mysql_connect[Connection failed] # Plain text # Italian
{ :text=>"Connessione non riuscita: Can't connect to local MySQL server through socket ", :certainty=>25 },

# mysql_connect[Connection failed] # HTML # English
{ :text=>"<b>Warning</b>:  mysql_connect() [<a href='function.mysql-connect'>function.mysql-connect</a>]: Can't connect to local MySQL server through socket" },

# mysql_connect[Lost connection] # Plain text # English
{ :text=>"Warning: mysql_connect() [function.mysql-connect]: Lost connection to MySQL server at 'reading initial communication packet', ", :certainty=>25 },

# mysql_connect[Lost connection] # HTML # English
{ :text=>"<b>Warning</b>:  mysql_connect() [<a href='function.mysql-connect'>function.mysql-connect</a>]: Lost connection to MySQL server at 'reading initial communication packet', " },

# Grab mySQL username, server and database details

# mysql_connect[Access denied] # English # HTML
{ :account=>/<b>Warning<\/b>:  mysql_connect\(\) \[<a href='function.mysql-connect'>function.mysql-connect<\/a>\]: Access denied for user ([^\ ]+)/ },

# mysql_query[Access denied] # English # HTML
{ :account=>/<b>Warning<\/b>:  mysql_query\(\) \[<a href='function.mysql-query'>function.mysql-query<\/a>\]: Access denied for user ([^\ ]+)/ },

# mysql_connect[Access denied] # English # Plain text
{ :account=>/Error: Access denied for user ([^\ ]+) to database ([^\s]+)/ },
{ :string=>/Error: Access denied for user ([^\ ]+) to database ([^\s]+)/, :offset=>1 },

# mysql_connect[Connection failed] # English # Plain text
{ :string=>/Error: Connection to mySQL-database at ([^\ ]+) failed!/ },

# mysql_connect[Lost connection] # Italian # Plain text
{ :string=>/Errore: Non riesco a connettermi al server MySql ([a-z0-9\.\-\_]+)/ },

# mysql_connect[Lost connection] # Italian # Plain text
{ :string=>/Errore: Non riesco a selezionare il database ([a-z0-9\.\-\_]+)/ },

]

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 #
# Fixed bug with returned modules not comma seperated
##
Plugin.define "TheHostingTool" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-12
version "0.2"
description "homepage: http://thehostingtool.com/"

# 161 results for "powered by TheHostingTool" @ 2010-10-12
examples %w|
100mb.ca/tht/client/
billing.freeresellers.com
client.host-it.org/support/
client.host-it.org/support/
client.myheberg.com/client/
client.myheberg.com/order/
clientes.teratecno.com/client/
clients.hostspeed.us
commande.geekheberg.net/order/
corruptedradio.freehostia.com
domainelectronic.org/host/admin/
e-sts.com/admin/
host2.cz.cc/host/
hostingbyus.info/tht/
iconic24.com
member.bubutech.com/client/
orders.webmediafusion.com/client/
p2h.chemicalservers.com/order/
s3.fspacedns.com/client/support/
sillyhost.net/my/admin/
syxe.com/hosting/
sitebunker.net/clients/client/
vxnhost.info/order/support/
zoombastudio.com/client/
www.000site.net/order/admin/
www.atacamahost.cl/THT/client/
www.codnet.com/hosting/support/
www.esource.perfectz.info/tht/order/
www.host2x.net/tht/
www.itneed.net/billing/
www.ketowebservices.info/order/
www.lancerhost.net/clientes/
www.mazvfx.co.uk/hosting/client/
www.monsite.tk/client/support/
www.teratecno.com/clientes/
|

matches [

# Version detection # Powered by text
{ :version=>/<div id="footer">Powered by <a href="http:\/\/thehostingtool.com" target="_blank">TheHostingTool<\/a> ([\d\.]*)<\/div>/ },

]

def passive
	m=[]

	# PHP Version detection
	if @body =~ /<td> ([\d\.]+) \(<a href="\?page=status&sub=phpinfo">PHPInfo<\/a>\)<\/td>/
		version=@body.scan(/<td> ([\d\.]+) \(<a href="\?page=status&sub=phpinfo">PHPInfo<\/a>\)<\/td>/).to_s
		m << { :version=>"PHP:"+version }
	end

	# MySQL version detection
	if @body =~ /<td><strong>MySQL Version:<\/strong><\/td>[\r\n|\n]+<td> ([\d\.]+) <\/td>/
		version=@body.scan(/<td><strong>MySQL Version:<\/strong><\/td>[\r\n|\n]+<td> ([\d\.]+) <\/td>/).to_s
		m << { :version=>"MySQL:"+version }
	end

	# OS detection
	if @body =~ /<td width="20%"><strong>Server OS:<\/strong><\/td>[\r\n|\n]+<td width="80%"> ([^\ ]+) <\/td>/
		version=@body.scan(/<td width="20%"><strong>Server OS:<\/strong><\/td>[\r\n|\n]+<td width="80%"> ([^\ ]+) <\/td>/).to_s
		m << { :version=>version }
	end

	# Module detection
	if @body =~ /<td align="center"><strong>([^<]+)<\/strong><\/td>/
		modules=@body.scan(/<td align="center"><strong>([^<]+)<\/strong><\/td>/)
		m << { :module=>modules }
	end

	m

end

end


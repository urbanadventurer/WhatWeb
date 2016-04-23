##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RFI-Scanner-Bot" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-15
version "0.1"
description "This plugin idenitfies instances of Remote File Include Scanner bots (aka feelscanz.pl, gmjk.pl, FeeLCoMz.pl, rfi.pl) and extracts the command and control servers, channels and passwords."

# 57 results for "##[ RUTIN SEARCH ENGINE ]##" "my @servers" "#!/usr/bin/perl" @ 2010-10-15
# 21 results for "perl feelscanz.pl <chan w/o #> <server> <port>" @ 2010-10-15
# 57 results for "my @servers" "#!/usr/bin/perl" +chan +nick ext:txt


# Extract bot config
def passive
	m=[]

	if @body =~ /^## + RFI Scan & Exploit \(Exploit per engine\)        ##/ or @body =~ /^######################################################/ or @body =~ /^##   perl feelscanz.pl <chan w\/o #> <server> <port> ##/ or @body =~ /##\[ RUTIN SEARCH ENGINE \]##/ or @body =~ /^## + Fixed cryptz command \(v4.5\)/ and @body =~ /^#!\/usr\/bin\/perl/

		# Servers
		if @body =~ /^my @servers[\s]*=[\s]*\(([^\)]+)/
			modules=@body.scan(/^my @servers[\s]*=[\s]*\(([^\)]+)/)
			m << {:module=>modules}
		end

		# Port
		if @body =~ /^my @ports[\s]*=[\s]*\(([^\)]+)/
			modules=@body.scan(/^my @ports[\s]*=[\s]*\(([^\)]+)/)
			m << {:module=>modules}
		elsif @body =~ /^[\s]+port[\s]*=>[\s]*([^\r^\n]+)/
			modules=@body.scan(/^[\s]+port[\s]*=>[\s]*([^\r^\n]+)/)
			m << {:module=>modules}
		end

		# Channels
		if @body =~ /^[\s]+chan[\s]*=>[\s]*([^\r^\n]+)/
			modules=@body.scan(/^[\s]+chan[\s]*=>[\s]*([^\r^\n]+)/)
			m << {:module=>modules}
		end

		# Accounts
		if @body =~ /^[\s]*pass[\s]*=>[\s]*([^,^\r^\n]+)/
			accounts=@body.scan(/^[\s]*pass[\s]*=>[\s]*([^,^\r^\n]+)/)
			m << {:account=>accounts}
		end

		# Version
		if @body =~ /^my \$versi[\s]*=[\s]*"([^\"]+)/
			version=@body.scan(/^my \$versi[\s]*=[\s]*"([^\"]+)/)
			m << {:version=>version}
		end

	end

	m

end

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Webbler" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-05
version "0.1"
description "The Webbler is a powerful tool to build new websites or add additional areas or functionality to your existing website. It is a Content Management System (CMS) and an Application Toolkit that we customise to suit your needs. - Homepage: http://www.tincan.co.uk/Webbler"

# ShodanHQ results as at 2011-04-05 #
# 1 for WebblerSession

# Google results as at 2011-05-04 #
# 122 for "Powered by the Webbler"

# Dorks #
dorks [
'"Powered by the Webbler"'
]

# Examples #
examples %w|
www.tincan.co.uk/Webbler
www.webbler.co.uk
www.phplist.com
www.rccil.org.uk
www.getconnected.org.uk
www.minorityrights.org
www.icar.webbler.co.uk
www.peopleandplanet.net
www.populationandsustainability.org
www.stigmaindex.org
www.liverpoolphil.com
www.nationaltheatre.org.uk
pharmitech.net
www.jubileedebtcampaign.org.uk
www.corporatewatch.org.uk
77.240.4.51
|

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="webbler ([^\s]+) - http:\/\/tincan\.co\.uk\/webbler"  \/?>/ },

]

# Passive #
def passive
	m=[]

	# Cookie
	m << { :name=>"WebblerSession Cookie" } if @meta["set-cookie"] =~ /WebblerSession=/

	# Return passive matches
	m
end

end



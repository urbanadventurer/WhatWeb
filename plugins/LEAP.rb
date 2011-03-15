##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "LEAP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-15
version "0.1"
description "LEAP is a Content Management System (LEAP CMS), yet so much more than this. Because of its wide range of features that go beyond content management, it is also referred to as a Website Operating System. - Homepage: http://www.leapcms.com/"

# Google results as at 2011-03-15 #
# 113 for inurl:LEAP/error.lasso

# Examples #
examples %w|
www.leapcms.com
www.mistertransmission.com
www.spectraaluminum.com
electromenager.mabe.ca
www.mamalution.com
www.saeinc.com
www.newmarketchamber.ca
www.itcsystems.com
www.camprobinhood.ca
www.treefrog.ca
www.smartcommutecentralyork.ca
www.carronfarms.ca
ksr.utoronto.ca
www.bathway.ca
www.pcmh.ca
www.canopytower.com
www.bridgetranslations.com
www.farrow.com
www.401bay.com
www.myostat.ca
www.tec-canada.com
www.pathwaystoperennials.com
www.consultnovita.com
www.grailsprings.com
www.vitalalert.com
www.newmarketdental.ca
www.premiereballroom.com
www.leapjob.com
www.marriageprep.com
www.provisionit.ca
www.aurorahomeshow.ca
www.mamkhulu.org
ebfc.ca
www.bluezone.ca
www.jetice.com
www.nci-marketing.com
www.metformintl.com
www.traveltowellness.com
www.genus-loci.ca
www.frpo.org
www.gatheringsfloralstudio.com
www.whitehots.com
www.compcall.com
www.ottawalogistics.com
www.patientnews.com
www.resortsofontariopreferredsuppliers.com
www.novita.ca
www.phyllismorris.net
www.democraticdevelopment.ca
www.europatours.ca
www.tfwm.com
www.developpementdemocratique.ca
www.corecabling.com
cclfinancialinc.com
www.l3ap.com
www.blue-zone.ca
www.attractivecopy.ca
www.organizationalculturesurvey.com
harvestred.com
www.culturestrategysurvey.com
www.corecabling.ca
mail.mrtransmission.us
www.culturestrategysurveys.com
www.organizationalculturesurveys.com
www.bbwinternational.com
www.phyllismorris.info
www.sigmapromotions.ca
www.irishdancestudio.ca
|

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="Generator" content="LEAP ([\d\.]+)"( \/)?>/ },

# Version Detection # Meta Formatter
{ :version=>/<meta name="Formatter" content="LEAP ([\d\.]+)"( \/)?>/ },

]

# Passive #
def passive
	m=[]

	# window.location = host/LEAP/error.lasso JavaScript
	if @body =~ Regexp.new('if \(ls == lw.length\) window.location = "http[s]?:\/\/'+Regexp.escape(@base_uri.host)+'\/LEAP\/error.lasso";')
		m << { :name=>"/LEAP/error.lasso JavaScript" }
	end

	# /LEAP/ # 401 # www-authenticate
	if @status == 401 and @meta["www-authenticate"] =~ /^Basic realm="LEAP"$/ and @base_uri.path =~ /^\/LEAP\//
		m << { :name=>"/LEAP/ www-authenticate" }
	end

	# Return passive matches
	m

end

end


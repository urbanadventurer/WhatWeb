##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2
# removed :certainty=>100 and :name

Plugin.define "SilverStripe" do
author "Andrew Horton"
version "0.2"
description "SilverStripe is an opensource CMS written in PHP. It can run on Apache, IIS or lighthttpd. Homepage: http://www.silverstripe.com"

examples %w|http://beatone.co.uk/ http://charcoalinteriors.com.au/ http://customcanvas.fritzandandre.com/ http://hungryhearts.no http://maungataniwha.co.nz/ http://unbounded.org/ http://victoriaoruwari.com/ http://weonline.in  http://www.arprostatecancer.org/ http://www.benpearce.co.nz/ http://www.bradyinc.com/ http://www.cavendishimaging.com/ http://www.chapmansurfboards.com/ http://www.choidoco.com/demo/ http://www.enamaine.org/ http://www.executivemediasearch.com/ http://www.fairtradenap.net/ http://www.firstgalaxies.org/ http://www.frussian.com.ar/ http://www.fuel.ie/silverstripe http://www.gsbc.edu/ http://www.holistichealth.com/ http://www.hutmacherin.com/ http://www.infinitestillness.ie/ss http://www.intandemtheatre.org/ http://www.kitesurfnelson.co.nz/ http://www.latenightdisco.com/ http://www.lisamarieelliott.com/ http://www.maklerservice-greiz.de/ http://www.moerakihavenmotel.co.nz/ http://www.monjasantner.de/ http://www.moonlitekustoms.com/ http://www.moto-racepaint.com/ http://www.nadabakery.co.nz/ http://www.peterpanvakantieclub.nl/ http://www.rcaforum.org.nz/ http://www.robert80.de/ http://www.silverstripe.com/ http://www.silverstripe.org.pl/ http://www.stillrunnin.com/ http://www.textiprints.com/ http://www.thelightboxdesigns.com/ http://www.tobychampion.co.uk/ http://www.upstreamgroup.com/ http://www.verus.com.tr/ http://www.wend.nl/ http://www.whileyouwait.co.nz/ |

#<meta name="generator" http-equiv="generator" content="SilverStripe 2.0 - http://www.silverstripe.com" >
#<meta name="generator" http-equiv="generator" content="SilverStripe 2.0 - http://www.silverstripe.com" />
#<meta name="generator" http-equiv="generator" content="SilverStripe 2.3.0 - http://www.silverstripe.com" />
#<meta name="generator" http-equiv="generator" content="SilverStripe 2.3.1 - http://www.silverstripe.com" >
#<meta name="generator" http-equiv="generator" content="SilverStripe 2.3.1 - http://www.silverstripe.com" />
#<meta name="generator" http-equiv="generator" content="SilverStripe - http://www.silverstripe.com" >
#<meta name="generator" http-equiv="generator" content="SilverStripe - http://www.silverstripe.com" />

matches [
{:regexp=>/<meta name="generator"[^>]*content="SilverStripe/}, #" 

{:name=>"layout, typography, form css files",
:certainty=>75,
:regexp=>/<link[^>]*stylesheet[^>]*layout.css[^>]*>[^<]*<link[^>]*stylesheet[^>]*typography.css[^>]*>[^<]*<link[^>]*stylesheet[^>]*form.css[^>]*>/},

{:certainty=>75, :regexp=>/<img src="\/assets\/[^\/]+\/_resampled\/[^"]+.jpg"/} #"
] 

#	Set-Cookie: PastVisitor=1; expires=Wed, 02-Jun-2010 04:05:29 GMT; path=/
def passive
	m=[]
	m << {:name=>"PastVisitor Cookie" } if @meta["set-cookie"] =~ /PastVisitor=[0-9]+.*/	
	
	if @body =~ /<meta name="generator"[^>]*content="SilverStripe [0-9\.]+/
			v=@body.scan(/<meta name="generator"[^>]*content="SilverStripe ([0-9\.]+)/)[0].to_s
			m << {:name=>"meta generator version", :version=>v }
	end
	m
end

end


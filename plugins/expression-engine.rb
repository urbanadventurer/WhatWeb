##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name and :certainty=>100

Plugin.define "ExpressionEngine" do
author "Andrew Horton"
version "0.2"
description "ExpressionEngine is CMS written in PHP. Free and commercial versions. Homepage: http://expressionengine.com"

examples %w|
http://5pieces.com
http://clinician1.com/
http://festival.sundance.org/2009/
http://www.christopheharbour.com
http://www.fiannafail.ie
http://www.realty.com
http://www.shooma.co.uk/
http://www.williamnoland.com
http://www.wiredgamescafe.co.uk/
http://myphotographicmemory.com
http://northlandchurch.net
http://passthequilt.org
https://www.privateaccess.info/
http://ucsf.edu/
http://www.bigredcreative.com/
http://www.chocolace.co.uk/
http://www.ksba.org/
http://www.truthdig.com/
http://www.designandi.co.uk/
http://www.edward-lloyd-trust.co.uk
http://www.gifttrap.com/photocompetition/
http://www.jonburgerman.com/
http://www.myfirstmac.com
http://www.philmerrick.com/
http://www.ropeadope.com/
http://www.sparkreclame.nl
http://www.sweettreasuresquiltpatterns.com/
http://freedomfilmfest.komas.org
http://mdv1.com/
http://selfstorage.net.au/
http://testdevices.com
http://twitchfilm.net/site/
http://www.francouver.ca/
http://www.kentandfraser.com/
http://www.regent-seven-seas-cruises-discount.com
http://www.weko-immobilien.com/
http://dpsdevelopment.com/
http://ftv.chapman.edu/
http://wsum.org
http://www.adoptivefamiliescircle.com
http://www.charlestonfoodandwine.com
http://www.cincinnatipediatrics.com/
http://www.fieldturf.com/
http://www.freestylemusicpark.com
http://www.inglathcooper.com/
http://dabrook.org/
http://ellislab.com/
http://seedmagazine.com/ui09/
http://www.blairconsular.co.uk/
http://www.franceskay.co.uk
http://www.northerngateway.co.nz/
http://www.sciencebridge.net
http://www.thoroughbredrehabilitationcentre.co.uk/
http://www.weko-immobilien.com/
http://blackbookmag.com/
http://knowledgeforgrowth.be/
http://madisonfrequency.com/
http://shearsgreenjuniorschool.co.uk
http://www.carnivalparty.com
http://www.citycarsbrighton.com
http://www.gotajob.com/
http://www.maryfisherdesign.com
http://www.prepaidawards.com
|

#Powered by <a href="http://expressionengine.com/">ExpressionEngine</a>   uncommon

matches [
{:regexp=>/owered by <a href="http:\/\/expressionengine.com\/">ExpressionEngine<\/a>/}
]

#Set-Cookie: exp_last_visit=959242411; expires=Mon, 23-May-2011 03:13:31 GMT; path=/
#Set-Cookie: exp_last_activity=1274602411; expires=Mon, 23-May-2011 03:13:31 GMT; path=/
#Set-Cookie: exp_tracker=a%3A1%3A%7Bi%3A0%3Bs%3A5%3A%22index%22%3B%7D; path=/

def passive
        m=[]        
        m << {:name=>"exp_last_visit cookie" } if @meta["set-cookie"] =~ /exp_last_visit=/
        m
end

# these plugins only identify the system. they don't find out the version, etc
def aggressive
	m=[]
	
	target = URI.join(@base_uri.to_s,"READ_THIS_FIRST.txt").to_s
	status,url,ip,body,headers=open_target(target)
	
	if body =~ /ExpressionEngine/
		m << {:name=>"readthisfirst txt file" }
	end

	target = URI.join(@base_uri.to_s,"system/updates/ee_logo.jpg").to_s
	status,url,ip,body,headers=open_target(target)
	
	if status == 200 and body =~ /JFIF/
		m << {:name=>"ee_logo jpg" }
	end
		
	m
end

end



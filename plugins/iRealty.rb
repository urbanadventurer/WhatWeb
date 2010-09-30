##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "iRealty" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "iRealty is an advanced flexible php real estate software and CMS with open source code. - homepage: http://www.irealtysoft.com/"

# 52 results for "powered by iRealty" @ 2010-08-08
examples %w|
informasikos.com
www.sakanonline.com
www.stefanouproperties.com
fortmyersvacationrentalsfl.com
homesperson2person.com
www.jameendalal.com
www.bulgaria-apartments.org
www.mrrent-paphos.net
www.searchlosangeleshomes.com
www.hottarget.de
www.elarabia-estate.com
www.exchangeproperties.co.uk
www.craigrooms.com
www.propertyforsale.gr
inmomenorca.es
www.propertymarketservice.co.uk
www.collegebyowner.com
www.panama.bz
www.yuva24.com
www.viveyanda.com
home2cell.com
www.dlm.hr
|

matches [

{ :text=>'Powered by <a href="http://www.irealty.com/" title="iRealty"> iRealty </a>' },

{ :text=>'<a target="_blank" href="http://www.irealtysoft.com/">- Powered by iRealty</a>' },

{ :text=>'Powered by <a target="_blank" title="iRealty &mdash; Real Estate Listing Software" href="http://www.irealtysoft.com/">iRealty</a>,' },

{ :text=>'Powered by <a target="_blank" title="iRealty &mdash; Real Estate Listing Software" href="http://www.worksforweb.com/products/iRealty/">iRealty</a>,' },

]

# Match PHPSESSID%28_%29 cookie
def passive
        m=[]

	m << { :name=>"iRealty PHPSESSID%28_%29 cookie" } if @meta["set-cookie"] =~ /^PHPSESSID%28_%29=[a-z0-9]{32}/

        m

end


end


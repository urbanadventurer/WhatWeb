##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "PortalApp" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-10
version "0.1"
description "PortalApp is a fast, flexible, configurable CMS and portal system that can be used to create everything from Blogs to Web sites. - homepage: http://www.portalapp.com/"
examples %w|
www.portalapp.com/default.asp
www.euroufo.net/content.asp
www.aspapp.com/content.asp
www.redesambientales.org.co
pandorasrl.com
www.samorsae.com
superficies.elladrillorojo.com
202.158.79.180/portalsdm/
superficies.lrgrup.com
franquicias.elladrillorojo.com
www.iwtatwork.com/content.asp
www.ngkrooihuiskraal.org.za
www.informationquest.it
www.parcodellefavole.it
www.watsampatuan.ac.th
www.klongtaaiem.ac.th
www.wkss.ac.th
www.watintaram.ac.th
www.watthod.ac.th
www.slk.ac.th
www.skad80.ac.th
www.ben4.ac.th
www.slschool.ac.th
www.watbangprong.ac.th
www.watkrongtonman.ac.th
www.watgatesamosorn.ac.th
www.sakaedod.ac.th
www.darulna-im.ac.th
|

matches [

# 155 results for "powered by PortalApp" -exploit @ 2010-07-10
{:regexp=>/<img src='[\/]*images\/palogo_gr_17.gif' height=23 alt='powered by PortalApp' align=[\'|\"]*[center|middle]+[\'|\"]*><\/A>/ },

{:regexp=>/<meta name=[\'|\"]*generator[\'|\"]* content=[\'|\"]*aspapp.com[\'|\"]*[\ \/]*>/ },
]

end


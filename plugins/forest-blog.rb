##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Forest-Blog" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-12
version "0.1"
description "Forest Blog - homepage: http://www.hostforest.co.uk/Products/blog.asp"

# 243 results for "powered by Forest Blog" @ 2010-08-11
# 15 results for intitle:"Forest Blog Administration" @ 2010-08-11
examples %w|
www.jonathantokeley.com/Admin/
poweron.mobile88.com/Admin/
www.homeschool4you.com/Admin/
blog.ammamalayalam.com/Admin/login.asp
www.revivegroup.com.au/blog/Admin/login.asp
www.searchengineposition.com/blog/Admin/
www.rjmedina.com/hacks/Admin/login.asp
www.wehategoogle.org/Admin/login.asp
www.e-designs.ca/Admin/login.asp
twoseveneight.iobb.net/blogs/rina_blog/Admin/
www.patientpower.info/blog/Admin/
www.felixcafarelli.com/public/SocialBlog/Admin/login.asp
www.grenzeloosliefhebben.nl/Admin/login.asp
www.asianfilmarchive.org/blog/Admin/login.asp
positivefuturist.com/Admin/login.asp
www.lighthouseassociates.com/blog/Admin/login.asp
www.blogpac.org
www.angelrockproject.com/arp/blog/
www.searchengineposition.com
positivefuturist.com
www.usefilm.com/blog/
blog.winemessenger.com/
www.eadtu.nl/blog/
www.chineseteastore.net/teablog/
www.expeditions.com/blog/
poweron.mobile88.com
www.markvoss.net
www.cartoonstock.com/cs_blog/default.asp
www.producerpack.com/Articles/
bloggingcrazy.com
blog.ready2invest.co.uk
www.maryjanesfarm.org/RFBlog/
sfgblog.maryjanesfarm.org/default.asp
rfgblog.maryjanesfarm.org
mfgblog.maryjanesfarm.org
www.marketdeveloper.com/blog/
www.helpmetechs.com/blog/
www.homeschool4you.com
clemetzoo.com/zblog/default.asp
blog.nicolasmusic.com/default.asp
www.ezuploadplus.com/blog/
www.taxcollector.com/blog/
www.technojabber.com
www.cashtree.com/blog/
www.buildprogress.com/blog/default.asp
www.santadays.co.uk/blog/
www.limoanywhere.com/blog/
www.rickcable.com/blog/default.asp
www.waterfowlersrus.com/blog.asp
www.triventek-ductcleaning.com/blog/
www.diverselist.com/blog/
www.flpharmacist.com
www.gajett.com
blog.symmetryplc.com
robertin.com
www.pbtalent.com/blog/
www.theblah.net
7thtee.us
blog.comedyrobot.com
www.nsifa.co.uk/blog/
www.ianblair.com
ellen.illinoisffa.org
blog.biggerplate.com
|

matches [

{ :regexp=>/Powered [B|b]+y: <a href="http:\/\/www.hostforest.co.uk\/[Products\/blog.asp|Blog]+" [class|rel]*="external" title="Forest Blog[\ \(link opens in a new window\)]*"/ },

# Admin Page
{ :text=>'<title>Forest Blog Administration</title>' },
{ :text=>'			<h1>Forest Blog Administration</h1>' },

]

def passive
        m=[]

        if @body =~ /Powered [B|b]+y: <a href="http:\/\/www.hostforest.co.uk\/[Products\/blog.asp|Blog]+" [class|rel]*="external" title="Forest Blog[\ \(link opens in a new window\)]*">Forest Blog<\/a> v[\d\.]+/
                version=@body.scan(/Powered [B|b]+y: <a href="http:\/\/www.hostforest.co.uk\/[Products\/blog.asp|Blog]+" [class|rel]*="external" title="Forest Blog[\ \(link opens in a new window\)]*">Forest Blog<\/a> v([\d\.]+)/)[0][0]
                m << {:version=>version}
        end

        m

end


end


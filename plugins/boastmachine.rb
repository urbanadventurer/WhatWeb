##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "boastMachine" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-16
version "0.1"
description "blog - homepage: http://boastology.com/"
examples %w|
www.coolzen.com
www.askdatabaseblogs.com
www.leonism.com
am3n.profusehost.net
www.cycleanywhere.com/blog/
tandij.com
deliwish.ls-aurora.com
www.pmhub.net/blog/
www.adaa.org.au/Blog/
www.intag.org/blog/darwin_onto.php
www.onemanswisdom.info
www.meetmadalyn.com/blog/
www.brionscheidel.com/blog/
www.hitechreps.com
www.chellbell.com/blog/
www.rainbowconceptions.com/rbrbrb/newblog/
www.goghdesign.com/thunderdog/thunderblog/
xsafari.com/blog/ekfblog.php
www.jrlsc.in/allfixonline_new/blog/bmachine/
gbytes.gsood.com/health.php
wonderrland.com/index.php
www.cycleanywhere.com/blog/
|

matches [

# 217 results @ 2010-06-16
{:name=>'GHDB: "powered by boastMachine" +"Recent posts" -exploit',
:certainty=>75,
:ghdb=>'"powered by boastMachine" +"Recent posts" -exploit'
},

{:name=>"powered by text #1",
:certainty=>100,
:regexp=>/Powered by <a href="http:\/\/boastology.com">boastMachine v[\d\.]+<\/a>/
},

{:name=>"powered by text #2",
:certainty=>100,
:regexp=>/<a href="http:\/\/boastology.com"><img src="http:\/\/[a-zA-Z0-9\.\-\+\'\"\/_]*" alt="Powered by boastMachine" \/><\/a>/
},


]

def passive
        m=[]

        if @body =~ /Powered by <a href="http:\/\/boastology.com">boastMachine v[\d\.]+<\/a>/
                version=@body.scan(/Powered by <a href="http:\/\/boastology.com">boastMachine v([\d\.]+)<\/a>/)[0][0]
                m << {:certainty=>100,:name=>"powered by version text",:version=>version}
        end

        m
end

end



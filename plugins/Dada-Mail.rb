##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Dada-Mail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-18
version "0.1"
description "Dada Mail is a Contemporary Mailing List Manager. Dada Mail works brilliantly - especially when you want to run a verified, closed loop opt-in subscription-based mailing list that your subscribers can trust. - Homepage: http://dadamailproject.com/"

# Google results as at 2011-03-18 #
# 469 for "Powered by Dada Mail" ext:cgi inurl:mail.cgi

# Examples #
examples %w|
demo.dadamailproject.com/cgi-bin/dada/mail.cgi
www.clrc.ca.gov/cgi-bin/dada/mail.cgi/archive/agendas/newest/
lists.tva.gov/cgi-bin/dada/mail.cgi
www.dcosmic.net/cgi-bin/dada/mail.cgi
www.sweethearttree.com/cgi-bin/dada/mail.cgi
www.hemispheregames.com/mailbot/mail.cgi
www.netrascope.com/cgi-bin/dada/mail.cgi
www.anxietysupportnetwork.com/dadamail/mail.cgi
www.goodsol.com/cgi-bin/news/mail.cgi
humanrightstools.org/cgi-bin/dada/mail.cgi
www.bodycosmeticsbh.com/cgi-bin/dada/mail.cgi
www.agroforestry.net/mail.cgi
maillist.3dpixelnet.com/cgi-bin/dada/mail.cgi
www.saltboxrocks.com/cgi-bin/dada/mail.cgi
www.brianmcollins.com/mail_list/mail.cgi
www.joekidonastingray.com/cgi-bin/mail.cgi
www.healthylunches.org/cgi-bin/dada/mail.cgi
www.sancnet.org/lists/mail.cgi
www.oakdownbooks.com/DadaMail_OakdownNewsletter/mail.cgi
www.jdmwebservices.com/cgi-bin/dada/mail.cgi
www.lafetenews.com/cgi-bin/dada/mail.cgi
www.alabamaatheist.org/mailings/mail.cgi
www.univ-brest.fr/geosciences/dada/mail.cgi
sacorivercampingarea.com/cgi-bin/list/mail.cgi
greatjake.com/cgi-bin/dada/mail.cgi
www.rpcvinctest.com/dadamail/mail.cgi
tgm.org/cgi-bin/dada/mail.cgi
www.gornahoor.net/cgi-bin/dada/mail.cgi
aaai.org/cgi-dada/mail.cgi
www.onlygoodbusiness.com/cgi-bin/dada/mail.cgi
workministry.com/cgi-bin/dada/mail.cgi
www.yiot.org/newsletter/mail.cgi
www.chortle.co.uk/scripts/dada/mail.cgi
spyonus.com/cgi-bin/dada/mail.cgi
|

# Matches #
matches [

# GHDB
{ :ghdb=>'"Powered by Dada Mail" filetype:cgi inurl:mail.cgi' },

# HTML Comment
{ :regexp=>/<!-- Dada Mail is Copyright 1999 - 20[\d]{2} Justin Simoni -->/ },

# Version Detection # Powered by link
{ :version=>/Powered by <a href="http:\/\/(mojo.skazat.com|dadamailproject.com)" target="_blank" style="font-size:10px;font-family:Verdana,Arial">Dada Mail ([^\s^<]+)/, :offset=>1 },

]

end



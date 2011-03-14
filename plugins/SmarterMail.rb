##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SmarterMail" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "SmarterMail delivers Exchange-level email server software features for a fraction of the cost. With lower hardware requirements, superior stability and reduced maintenance costs, SmarterMail has significantly lower Total Cost of Ownership (TCO) and is the best-in-class Microsoft Exchange alternative for businesses and hosting companies. - Homepage: http://www.smartertools.com/smartermail/mail-server-software.aspx"

# Google results as at 2011-03-14 #
# 326 for intitle:"SmarterMail Login SmarterMail" "Remember me" "SmarterMail Enterprise"|"SmarterMail Professional"|"SmarterMail Free"

# Examples #
examples %w|
mail.verticalwebmedia.com
mail.iwebspace.com
mail.singaporerealtors.com
www.emilystrange.com/webmail/
mail.viaarena.com
smartermail.seekdotnet.com
mail.rapidpat.com
mail.mrx.net
mail.hoopa-nsn.gov
webmail.3tassociates.com
www.aim.registrarservers.net
email.cewd.com
74.121.184.16
mail.residence.com.my
www.domainhost.hu/mail/
webmail.nomer.com.br
mail.alank.org
mail.cleanfuelsconsulting.org
webmail.qcommerce.com
mail.trader-one.com
mail.livingadvantageinc.org
www.bodegaassociation.org
mail.iiehongkong.org:8080
mail.inno-tech.com
webmail.nexion.biz
newmail.dotnetpark.com
mail.albayan.edu.qa/
mail.beaconcollege.edu/Login.aspx
mail.ndic.com
webmail-vserver83.3essentials.com
www.mailwny.com
www.hline.org
webmail.lisp.com.au
mail.hfc-realty.com
mail.claritytech.com
mail.pixrite.com
mail.cbscarlow.net:9998
mail.rietabh.ac.in
mail.celsolar.com
mail.sunlighttaxi.com
mail.psscloud.com
mail.pixelmarsala.com
mail.atsireland.com
www.godirect.in
mail.litewire.net
www.alt-glass.com.au
cf-ntmail.ci.findlay.oh.us:8383
looijs.com
mail.boroughofwenonah.com
mail.endoradigital.com
203.150.224.15:9998
|

# Matches #
matches [

# Product Detection # Vendor Link # >= 4.x
{ :string=>/<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>SmarterMail (Enterprise|Professional|Free|FREE) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>(Windows Mail Server|Email Server Software|Mail Server Software)<\/a>/ },

# Verson Detection # Vendor Link # >= 4.x
{ :version=>/<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>SmarterMail (Enterprise|Professional|Free|FREE) ([\d\.]+)<\/a>( |&nbsp;)\|( |&nbsp;)<a href='http:\/\/www.smartertools.com\/smartermail\/mail-server-software.aspx' target='_blank'>(Windows Mail Server|Email Server Software|Mail Server Software)<\/a>/, :offset=>1 },

# Product Detection # td bar1inner # <= 3.x
{ :string=>/										<td class="?bar1inner"?>SmarterMail (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/ },

# Version Detection # td bar1inner # <= 3.x
{ :version=>/										<td class="?bar1inner"?>SmarterMail (Enterprise|Professional|Free|FREE) Edition ([\d\.]+)<\/td>/, :offset=>1 },

# Title
{ :text=>"<title>Login - SmarterMail</title>" },

]

end



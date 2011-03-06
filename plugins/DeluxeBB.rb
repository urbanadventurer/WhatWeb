##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "DeluxeBB" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "DeluxeBB is a powerful open source bulletin board, which helps you create your own web communities in less than 10 minutes. The board is written completely in PHP and uses a MySQL database to store its content. - Homepage: http://www.deluxebb.com/"

# Google results as at 2011-02-27 #
# 69 for "DeluxeBB 1.3 is copyrighted to the DeluxeBB team '05-08"

# Examples #
examples %w|
www.deluxebb.com/demo/index.php
www.deluxebb.com/community/
eu-portal24.de
forum.freieunion-sachsenanhalt.de
pprs.derbfactory.net/forum/
www.n4iqt.com/bb/
www.artoi.it/public/forum/
www.chillinshades.com/sccobbs/
www.scantruck.com.my/index1.php
www.adf21.net/deluxeBB/
www.gotgolfing.com/forum/
www.josefeliciano.com/fanforum/
www.itsworthfixing.com/cartalk/
www.elisabethinen.or.at/40000_medizin/40260_turnus/deluxebb1_3/
www.isabelallendebussi.cl/deluxebb/
www.fussballinlondon.de/forum/
www.sv-laim.de/forum/
www.stepphahn.de/forum1/
www.pauschalreisen.ch/reise-forum/
www.centropsicosomatica.cl/forum/
www.gemini-web.de/forum/
www.magnet-motor-forum.de/forum_alt/
www.vjcentral.de
|

# Matches #
matches [

# Default HTML Comment
{ :regexp=>/<!-- \|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|-\|[\r\n\s]+\| This forum is coded by and          \|[\r\n\s]+\| copyrighted to Frank Nissel         \|/ },

# Meta Description
{ :text=>'<meta name="description" content="powered by DeluxeBB - www.deluxebb.com" />' },

# Version Detection # Copyright link text
{ :version=>/<p><a href="http:\/\/www.deluxebb.com" target="_blank">DeluxeBB ([\d\.]+)<\/a> is copyrighted to the DeluxeBB team '05/ },

]

end



##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Juniper-NetScreen-Secure-Access" do
author "Aung Khant <http://yehg.net/>" # 2011-02-04
version "0.1"
description "Juniper Networks NetScreen Secure Access (SSL VPN) - http://www.juniper.net/"

examples %w|
https://vpn.lib.ucdavis.edu/
https://myvpn.ford.com/
https://webaccess.areva-td.com/
https://vpn-cr.aegonins.com/
https://inet.bmofg.com/
https://eu.maxlite.mobi/
https://remote.chpnet.org/
https://remote.mercy.net/
https://rsvpn.raytheon.com/
https://connect.spsu.edu/
https://vpn.ucsf.edu/
https://vpn2.safelnk.net/
https://hsslvpn.honeywell.com/
https://webaccess.pg.com/
https://online.novanthealth.org/
https://cans.educationicts.co.uk/
https://mdajun.mdanderson.org/
https://xtranet.umm.edu/
https://teamworks.gdit.com/
https://site03.remoteoffice.citigroup.com/
https://lmpassage3.external.lmco.com/
https://sra.cn.ca/
https://sslvpn.pitt.edu/
https://webvpn.nus.edu.sg/
https://gateway.slb.com/
https://go.connectge.com/
https://webportal.parsons.com/
https://remotevpn.meijer.com/
https://nantes.metagate.francetelecom.com/
https://dashboard.chrysler.com/
https://sslvpn.medical.washington.edu/
https://mygp.gp.com/
https://www.myweatherford.ca/
https://securevpn.tm.com.my/
https://gateway.wipro.com/
https://vpn.umbc.edu/
https://connect.bechtel.com/?p=no-roles
https://connect.nestle.biz/
https://access.hersheymed.net/
https://rap.northshorelij.com/
https://hhin.hmsa.com/
https://usbportal.usbank.com/
https://secureaccess.intermountainhealthcare.org/
https://rcconnect.rockwellcollins.com/
https://webvpn.nmh.org/
https://asg.statestreet.com/
https://sap.bsli.in/
|



matches [

{:name => 'juniper logo md5', :md5=> '1ec04eec4e1898da8258215a2eb4758b', :url=>'/dana-na/auth/welcome.cgi?p=rolelogo'},

{:name => 'html body', :regexp=>/src="\/dana\-na\/css\/ds\.js">|<img border="0" src="welcome\.cgi\?p=logo|src="\/dana\-na\/imgs\/space\.gif"|document\.cookie = "DSPREAUTH="\+ escape\(""\)|src="\/dana\-na\/auth\/url_default\/s/i }

]




end



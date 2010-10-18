##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "phpScheduleIt" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-01
version "0.1"
description "A web-based resource scheduling system that allows administered management of reservations on any number of resources. Typical applications are conference room or machine reservation management. Written in PHP and tested on MySQL.  - homepage: http://phpscheduleit.sourceforge.net"
# Default login: admin/admin

# 9 results for "powered by phpScheduleIt" @ 2010-08-01
examples %w|
php.brickhost.com/demo/
www.wherehealthbegins.com/onlinebooking/roschedule.php
https://zenon.joslin.harvard.edu/FlowSchedule/
apps.dmc.rice.edu/phpScheduleIt/
dumbbellstoo.com/schedule/roschedule.php
https://reservation.cs.iastate.edu
labschedule.cabfablab.nl/roschedule.php
|

matches [

# Powered by text
{ :text=>'<p align="center">Powered by <a href="http://phpscheduleit.sourceforge.net">phpScheduleIt</a></p>' },
{ :text=>'<p align="right"><a href="http://phpscheduleit.sourceforge.net">Powered By phpScheduleIt' },
{ :text=>'<br>Powered By: phpScheduleIt</p>' },

]

# Version detection using powered by text
def passive
        m=[]

        if @body =~ /<p align="center">[<!\-]*<a href="http:\/\/phpscheduleit.sourceforge.net">[\->]*Powered By phpScheduleIt v[\d\.]+[<!\-]*<\/a>[\->]*<\/p>/
                version=@body.scan(/<p align="center">[<!\-]*<a href="http:\/\/phpscheduleit.sourceforge.net">[\->]*Powered By phpScheduleIt v([\d\.]+)[<!\-]*<\/a>[\->]*<\/p>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /<p align="center">[\ Powered\ by\ ]*<a href="http:\/\/phpscheduleit.sourceforge.net">phpScheduleIt v[\d\.]+<\/a><\/p>/
                version=@body.scan(/<p align="center">[\ Powered\ by\ ]*<a href="http:\/\/phpscheduleit.sourceforge.net">phpScheduleIt v([\d\.]+)<\/a><\/p>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /[P|p]?owered by <a href="http:\/\/phpscheduleit.sourceforge.net"[\ target="_blank"]*>phpScheduleIt v[\d\.]+<\/a>/
                version=@body.scan(/[P|p]?owered by <a href="http:\/\/phpscheduleit.sourceforge.net"[\ target="_blank"]*>phpScheduleIt v([\d\.]+)<\/a>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


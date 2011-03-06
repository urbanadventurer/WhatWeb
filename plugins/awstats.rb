##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# Version 0.2 by Andrew Horton
# Added version detection

Plugin.define "AWStats" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-06-04
version "0.2"
description "AWStats - Free log file analyzer for advanced statistics (GNU GPL). - homepage:http://awstats.sourceforge.net/"
examples %w|
alfven.princeton.edu/cgi-bin/awstats.pl
www.2server.amazound.com.ar/awstats/cgi-bin/awstats.pl
first-cis.com/awstats/cgi-bin/awstats.pl
graciaaudio.com/awstats/cgi-bin/awstats.pl/awstats.pl
http://pres4.thefungallink.com/awstats/cgi-bin/awstats.pl
endless-referrals.com/awstats/cgi-bin/awstats.pl
brementravelguide.com/awstats/cgi-bin/awstats.pl
westernwarner.com/awstats/cgi-bin/awstats.pl
sky-venture.org/awstats/cgi-bin/awstats.pl
cleaningfx.ca/awstats/cgi-bin/awstats.pl
173.83.42.254/awstats.old/cgi-bin/awstats.pl
flaub.com.ar/awstats/cgi-bin/awstats.pl
cupidoclub.net/awstats/cgi-bin/awstats.pl
abujafaralmonsor.com/awstats/cgi-bin/awstats.pl/awstats.pl
www.spiriteye.com/webstats/awstats.pl
hbg.dhcook.net/awstats/cgi-bin/awstats.pl
penninckx.com/awstats/cgi-bin/awstats.pl
download.haibei.net/cgi-bin/awstat/awstats.pl
bestbrospc.com/awstats/cgi-bin/awstats.pl
ddr.treasurechestsolutions.com/awstats/cgi-bin/awstats.pl
http://www.ligad-gifts.com/awstats/awstats.pl
http://www.sportscardauction.com/cgi-bin/stats/awstats.pl
http://www.bqto.unexpo.edu.ve/cgi-bin/awstats.pl
http://aria.org/webstats/awstats.pl
http://crowned.org/webstats/awstats.pl
|

matches [

# About 676,000 results @ 2010-6-04
{:certainty=>75, :ghdb=>'inurl:awstats ext:pl +intitle:"Statistics for"'},
{:text=>'<a href="http://awstats.sourceforge.net" target="_newawstats">Created by awstats</a><br>'},
{:text=>'<meta http-equiv="description" content="Awstats - Advanced Web Statistics for'},
{:name=>"default logo", :text=>'<a href="http://awstats.sourceforge.net" target="_newawstats"><img src="/icon/other/awstats_logo1.png" border=0 alt="awstats Official Web Site" title="awstats Official Web Site"></a>'},

{:version=>/<meta name="generator" content="AWStats ([0-9\.]+ \(build [0-9\.]+\))/}, #" good for 6.7
{:version=>/<FONT COLOR="#000000"><b>Advanced Web Statistics ([0-9\.]+ \(build [0-9\.]+\))/},

{:url=>'awstats.pl?framename=mainright', :version=>/<FONT COLOR="#000000"><b>Advanced Web Statistics ([0-9\.]+ \(build [0-9\.]+\))/}
]

# Version examples for 3.1, 5.5 and 6.7.

# <meta name="generator" content="AWStats 6.7 (build 1.892) from config file awstats.dhcook.net.conf (http://awstats.sourceforge.net)">

# there is no meta generator for 3.1
#<FONT COLOR="#000000"><b>Advanced Web Statistics 3.1 (build 41)</b> - <a href="http://awstats.sourceforge.net" target="_newawstats">Created by awstats</a><br>

# this is in awstats.pl?framename=mainright and there's on version info in /awstats.pl for 5.5
#<FONT COLOR="#000000"><b>Advanced Web Statistics 5.5 (build 1.500)</b> - <a href="http://awstats.sourceforge.net" target="awstatshome">Created by awstats</a></font><br>


def vulnerabilities(results)

	v=[]
	# cve checks
	versions=[]
	results.each do |result| versions << result[:version] unless result[:version].nil? end

	pp "versions are : " , versions
	# need to tidy, select the best version string. maybe the longest
	version = versions.first

	# check version is ok format
	if version =~ /[0-9.]+ \(build [0-9.]+\)/
		puts "version ok"
	else
		puts "version not ok"
	end
	version_number = version.split(' ')[0].to_f
	version_build = version.scan(/.*\(build ([0-9.]+)\)/)[0].to_s.to_f

	pp version_number, version_build

	if version_number >= 6.1 and version_number <= 6.3
		v << ["6.1-6.3", "CVE-2005-0116", "Remote Code Execution in aswtats.pl"]
	end

	if version_number >= 6.3 and version_number <= 6.4
		v << ["6.3-6.4", "CVE-2005-0435", "Information Disclosure vulnerability in the loadplugin and pluginmode parameters of awstats.pl."]
		v << ["6.3-6.4", "CVE-2005-0438", "Information disclosure vulnerability in the debug parameter of awstats.pl."]
	end
	if version_number <= 6.4
		v << ["-6.4", "CVE-2005-0436", "Remote Code Execution vulnerability in the PluginMode parameter of awstats.pl" ]
	end

	if version_number >= 6.4 and version_number <= 6.5
		# The web interface for AWStats 6.4 and 6.5, when statistics updates are enabled, allows remote attackers to execute arbitrary code via shell 	metacharacters in the migrate parameter. 
		# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-1527
		v << ["6.4-6.5", "CVE-2005-1527", "Remote Code Execution vulnerability in awstats.pl" ]
	end

	if version_number >= 6.4 and version_number <= 6.5
		v << ["6.4-6.5", "CVE-2006-2237", "Remote Code Execution vulnerability in the migrate parameter of awstats.pl."]
	end

	if version_number < 6.5 or (version_number == 6.5 and version_build<=1.857 )
		# awstats.pl in AWStats 6.5 build 1.857 and earlier allows remote attackers to obtain the installation path via the (1) year, (2) pluginmode or (3) month parameters.
		# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3682
		v << ["-6.5 build 1.857", "CVE-2006-3682", "Information Disclosure vulnerability in the year, pluginmode and month parameters of awstats.pl."]
	end

	if version_number < 6.5 or (version_number == 6.5 and version_build<=1.857 )
		# Multiple cross-site scripting (XSS) vulnerabilities in awstats.pl in AWStats 6.5 build 1.857 and earlier allow remote attackers to inject arbitrary web script or HTML via the (1) refererpagesfilter, (2) refererpagesfilterex, (3) urlfilterex, (4) urlfilter, (5) hostfilter, or (6) hostfilterex parameters, a different set of vectors than CVE-2006-1945. 
		# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3681
		v << ["-6.5 build 1.857", "CVE-2006-3681", "Cross Site Scripting vulnerability in the refererpagesfilter, refererpagesfilterex, urlfilterex, urlfilter, hostfilter, or hostfilterex parameters of awstats.pl." ]
	end

	if version_number == 6.8
		# Cross-site scripting (XSS) vulnerability in awstats.pl in AWStats 6.8 allows remote attackers to inject arbitrary web script or HTML via the query_string, a different vulnerability than CVE-2006-3681 and CVE-2006-1945.
		# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-3714
		v << ["6.8", "CVE-2008-3714", "Cross Site Scripting vulnerability in awstats.pl" ]
	end

	if version_number <=6.8
		# awstats.pl in AWStats 6.8 and earlier does not properly remove quote characters, which allows remote attackers to conduct cross-site scripting (XSS) attacks via the query_string parameter. NOTE: this issue exists because of an incomplete fix for CVE-2008-3714. 
		# http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-5080
		v << ["6.8-", "CVE-2008-5080", "Cross Site Scripting vulnerability in the query_string parameter of awstats.pl." ]
	end

	v
end

end


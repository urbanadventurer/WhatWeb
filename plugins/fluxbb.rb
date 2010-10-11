##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.3
# removed :name and :certainty=>100

Plugin.define "FluxBB" do
author "Andrew Horton"
version "0.3"
description "Opensource forum written in PHP. Homepage: http://fluxbb.org/. Aggressive plugin can identify 1.2.x, 1.3-r718, 1.3-beta2, 1.4-beta2, 1.4-rc1"

# Propuls&#233; par is not hte in French language pack. All languages still have 'Powered by'

examples %w|http://fluxbb.org/forums/ http://www.amdsquad.com/forums/ http://www.le-mesle.net/forum/index.php http://forums.epixplx.com/ http://forum.torg.su/ http://www.badharvest.net/forum forum.utorrent.com |

#fluxbb.org-forums-.html:	            <p id="copyright">Powered by <strong><a href="http://fluxbb.org/">FluxBB</a></strong></p>
#forums.epixplx.com-.html:			    <p class="conr">Powered by <a href="http://fluxbb.org/">FluxBB</a></p>
#forum.torg.su-.html:			        <p class="conr">Powered by <a href="http://fluxbb.org/">FluxBB</a> 1.2.22</p>
#www.amdsquad.com-forums-.html:			<p class="conr">Powered by <a href="http://fluxbb.org/">FluxBB</a></p>
#www.badharvest.net-forum.html:			<p class="conr">Powered by <a href="http://fluxbb.org/">FluxBB</a></p>
#www.le-mesle.net-forum-index.php.:     <p class="conr">Propuls&#233; par <a href="http://fluxbb.org/">FluxBB</a> 1.2.20<br />


matches [
{:name=>"Powered by", :regexp=>/(Powered by|Propuls&#233; par) (<strong>)?<a href="http:\/\/fluxbb.org\/">FluxBB<\/a>/},

# default styles - Cobalt.css  imports  index.html  Lithium.css  Mercury.css  Oxygen.css  Radium.css  Sulfur.css
{:certainty=>25, :regexp=>/<link rel="stylesheet" type="text\/css" href="style\/(Cobalt|Lithium|Mercury|Oxygen|Radium|Sulfur).css" \/>/},
{:certainty=>75, :text=>'<li id="navlogin"><a href="login.php">'},
{:certainty=>75, :regexp=>/<div id="brdwelcome" class="inbox">\s+<p>[^<]+<\/p>\s+<\/div>/}
]

def aggressive

# 1.3.x identified by lack of /admin_index.php or presence of /admin/ or /include/js/ or lack of /style/Cobalt.css or presence of /style/print.css
# 1.3-r718 or 1.4+  identified by presence of /include/utf8/

# 1.2 or 1.4 identified by /style/Mercury.css
# 02a0558c65d3d2e7c6895f6bd6e1edf9  fluxbb-1.2.x
# c14d6b084de46779f3b6fb396e74be19  fluxbb-1.4-beta2
# f89d52345d2d54a7026703d9a99380a7  fluxbb-1.4-rc1
# 1.3 doesn't exist
# many sites edit the Mercury.css file which must be a nuisance when upgrading

# /style/Sulfur.css
# 8d49e829aaf77164d0be3e05ef67c63d  fluxbb-1.2.x
# 88fb6eac3671593ef57c4b6b76802280  fluxbb-1.4-beta2
# ec6a6ac259f3de9a7c7f1b1b544387ba  fluxbb-1.4-rc1

# this 1 file can identify 1.2.x, 1.3 and 1.4
#1f71f1b79ca455f691b66e91d47523ec  fluxbb-1.2.18/upload/include/template/redirect.tpl
#1f71f1b79ca455f691b66e91d47523ec  fluxbb-1.2.19/upload/include/template/redirect.tpl
#1f71f1b79ca455f691b66e91d47523ec  fluxbb-1.2.20/upload/include/template/redirect.tpl
#1f71f1b79ca455f691b66e91d47523ec  fluxbb-1.2.21/upload/include/template/redirect.tpl
#1f71f1b79ca455f691b66e91d47523ec  fluxbb-1.2.22/upload/include/template/redirect.tpl
#8b8646ca85c42103ab1941ce33b4058c  fluxbb-1.3-beta2/upload/include/template/redirect.tpl
#d7f4ca403f7d4453158b0765196f8173  fluxbb-1.3-r718/upload/include/template/redirect.tpl
#ec3fc0a2fa3c13a8599be3cb4cd2aa71  fluxbb-1.4-beta2/upload/include/template/redirect.tpl
#2b361b3c0a7c6c81fa37da171e2c3514  fluxbb-1.4-rc1/upload/include/template/redirect.tpl

m=[]


# the paths are relative to the url path if they don't start with /
# this path, with this md5 = this version
files=[
{:version=>"1.2.x",		:path=>"style/Mercury.css", :md5=>"02a0558c65d3d2e7c6895f6bd6e1edf9"},
{:version=>"1.2.x",		:path=>"style/Sulfur.css", :md5=>"8d49e829aaf77164d0be3e05ef67c63d"},
{:version=>"1.3", 		:path=>"style/print.css", :md5=>"0956e3e8738ee13ee4845b90acd80a9c"},
{:version=>"1.4-beta2", :path=>"style/Mercury.css", :md5=>"c14d6b084de46779f3b6fb396e74be19"},
{:version=>"1.4-beta2", :path=>"style/Sulfur.css", :md5=>"88fb6eac3671593ef57c4b6b76802280"},
{:version=>"1.4-rc1", 	:path=>"style/Mercury.css", :md5=>"f89d52345d2d54a7026703d9a99380a7"},
{:version=>"1.4-rc1", 	:path=>"style/Mercury.css", :md5=>"ec6a6ac259f3de9a7c7f1b1b544387ba"},
{:version=>"1.2.x", 	:path=>"include/template/redirect.tpl", :md5=>"1f71f1b79ca455f691b66e91d47523ec"},
{:version=>"1.3-beta2", :path=>"include/template/redirect.tpl", :md5=>"8b8646ca85c42103ab1941ce33b4058c"},
{:version=>"1.3-r718", 	:path=>"include/template/redirect.tpl", :md5=>"d7f4ca403f7d4453158b0765196f8173"},
{:version=>"1.4-beta2", :path=>"include/template/redirect.tpl", :md5=>"ec3fc0a2fa3c13a8599be3cb4cd2aa71"},
{:version=>"1.4-rc1", 	:path=>"include/template/redirect.tpl", :md5=>"2b361b3c0a7c6c81fa37da171e2c3514"}
]

to_download = files.map {|x| x[:path] }.sort.uniq

downloads={}
to_download.each do |d|
	
	target = URI.join(@base_uri.to_s,d).to_s	
	status,url,ip,body,headers=open_target(target)

	downloads[d] = {:md5sum=>MD5.new(body).to_s}	
end

version=nil

files.each do |thisfile|
	unless downloads[thisfile[:path]].nil?
		version= thisfile[:version] if downloads[thisfile[:path]][:md5sum] == thisfile[:md5]
	end
end

unless version.nil?
	m << {:name=>"md5 sums of files", :version=>version}
end	
m
end

end



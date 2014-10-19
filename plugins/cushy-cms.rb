##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##


# Version 0.2
# removed :name and :certainty=>100

Plugin.define "CushyCMS" do
author "Andrew Horton"
version "0.2"
description "Simple, closed-source CMS. Free and paid versions. Built with Ruby on Rails"
website "http://www.cushycms.com/"

 

# Set-Cookie: _cushy_session=BAh7CDoPc2Vzc2lvbl9pZCIlYTkwOTgxZGRmNTVmMjY3ZGRmYWJiNDhkNzM4OWY2NzQ6DXJlZmVycmVyIgAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7AAY6CkB1c2VkewA%3D--e520ebeee34faf95fede4247ecaaf46fe80a84de; path=/; HttpOnly
#  <li id="poweredBy"><img alt="Powered by CushyCMS" src="/images/cushy_badge.gif?1274163122" /></li>

# this plugin wasn't made with enough samples... so it will probably miss some sites

matches [
{:text=>'Content Management Powered by <a href="http://www.cushycms.com">CushyCMS</a>'},
{:text=>'<li id="poweredBy"><img alt="Powered by CushyCMS" src="/images/cushy_badge.gif'},
{:text=>'<span id="cushycms-footer">Powered by CushyCMS</span>'},
{:regexp=>/<a href="http:\/\/www.cushycms.com\/[^>]+>(<font[^>]+>)?Powered by CushyCMS/}, #"
{:regexp=>/<[^>]+class="cushycms"/}
]

def passive
  m=[]
  m << {:name=>"Cushy Cookie" } if @headers["set-cookie"] =~ /_cushy_session=.*/
  m
end

end


##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RoundCube"
authors [
  "Andrew Horton",
  # v0.2 # removed :name & :certainty=>100
]
version "0.2"
description "Opensource Webmail written in PHP"
website "http://roundcube.net/"

# Version detection notes: older versions don't have the anti-CSRF token

matches [
{:text=>"<title>RoundCube Webmail :: Welcome to RoundCube Webmail</title>"},
{:text=>"var rcmail = new rcube_webmail();"},
{:text=>'<input name="_user" id="rcmloginuser"'},
{:text=>'$(document).ready(function(){ rcmail.init(); });'}

]

# Set-Cookie: roundcube_sessid=573c9cce97436b17e4ab02d83747efb2; path=/
passive do
	m=[]
	m << {:name=>"roundcube_sessid cookie" } if @headers["set-cookie"] =~ /roundcube_sessid/i		
	m
end


end


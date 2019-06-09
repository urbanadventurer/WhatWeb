##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "CodeIgniter-PHP-Framework"
authors [
  "Aung Khant <YGN Ethical Hacker Group, Myanmar, http://yehg.net>",
  # v2.0 # new random string
  "Andrew Horton", # v3 # 2017-11-27 # Tidied up. Added website.. 
]
version "0.3"
description "CodeIgniter PHP Framework"
website "http://codeigniter.com/"	

# Matches #
matches [
{:string=>'404 Signature',:url=>randstr(),:md5=>'e087ab5729efdfa939ba620e4593bd99'},
{:string=>'404 Signature',:url=>'index.php/'+randstr(),:md5=>'e087ab5729efdfa939ba620e4593bd99'},
{:string=>'Database Error Signature',:url=>'index.php/'+randstr(),:md5=>'951c845488483135e52252609a1d99b2'},
{:string=>'Database Error Signature',:md5=>'951c845488483135e52252609a1d99b2'},
{:string=>'Invalid Character Filter',:url=>randstr()+'!!!',:md5=>'c9b724012ab64481a034f9a453143ece'},
{:string=>'Invalid Character Filter',:url=>randstr()+'!!!',:text=>'The URI you submitted has disallowed characters.'},
{:search => "headers[set-cookie]", :regexp => /ci_session/, :name=>"ci_session cookie" },

]

end




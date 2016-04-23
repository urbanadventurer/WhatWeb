##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2016-04-23 # Andrew Horton
# Moved patterns from passive function to matches[]
##
# Version 3.0 by Andrew Horton
# new routine for POST requests
##
# Version 2.0 by Andrew Horton
# Added meta generator match and vendor matches. bug fixes. new random string function
##
# Version 0.1 
# detection works mainly for default installation state 
# tomatocms is based on zend framework
##
Plugin.define "Zend" do
author "Aung Khant <http://yehg.net>"
version "0.4"
description "Zend PHP Framework (http://framework.zend.com/) and Zend Server (http://zend.com) Detection"

	
matches [
# 2010-10-14
# About 1,640,000 results (0.24 seconds) 
# "Powered by Zend Framework" site:www.survivethedeepend.com/
{:name=>'GHDB: "Powered by Zend Framework"',:certainty=>75,:ghdb=>'"Powered by Zend Framework"'},
{:string=>'PoweredBy Image',:url=>'images/PoweredBy_ZF.gif',:md5=>'eecf384879cde19f8f7f80c768c12295'},
{:string=>'Zend Logo Small',:url=>'images/logo_small.gif',:md5=>'0f76017aa12a3dcb9cabbff26e37ff5c'},
{:string=>'Footer Link',:text=>' alt="Powered by Zend Framework!" />'},


{:string=>'Null Controller',:url=>randstr(),:text=>'controllers/images/PoweredBy_ZF.gif" alt="Powerd by Zend Framework!" />'},
{:string=>'Null Controller',:url=>randstr(),:regexp=>/<h1>Controller\/action not found!<\/h1>(\r\n|\n)<p>Controller\/action not found!<\/p>/},
{:string=>'Zend_Controller_Dispatcher_Exception',:url=>randstr(),:text=>'( ! )</span> Zend_Controller_Dispatcher_Exception: Invalid controller specified (application) in'},
{:string=>'Zend_Controller_Dispatcher_Exception',:url=>randstr(),:text=>"<b>Fatal error</b>:  Uncaught exception 'Zend_Controller_Dispatcher_Exception"},
{:string=>'Zend_Controller_Router_Exception',:url=>randstr(),:text=>"Uncaught exception 'Zend_Controller_Router_Exception' with message 'No route matched the request'"},
{:string=>'Zend_Controller_Router_Exception',:url=>randstr(),:text=>"/Zend/Controller/Router/Rewrite.php</b> on line <b>"},

{:version=>/<meta name="generator" content="Zend.com CMS ([\d\.]+)"/ },
{:text=>'<meta name="vendor" content="Zend Technologies'},


# X-Powered-By=Zend Framework
# X-Powered-By=Zend Framework 1.10
# X-Powered-By: Zend Core/2.5.0

{ :regexp=>/Zend Framework/, :search=>"headers[x-powered-by]" },
{ :version=>/Zend Framework ([a-zA-Z0-9\.\/\+\-\(\)]+)/, :string=>"Framework", :search=>"headers[x-powered-by]" },
{ :version=>/Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/, :string=>"Core", :search=>"headers[x-powered-by]" },

# Server: Zend Core/2.5.0
{ :regexp=>/^Zend /, :search=>"headers[server]" },
{ :version=>/Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/, :string=>"Core", :search=>"headers[server]" },

]


def aggressive
# when submiting invalid post to valid controller 
#<h1>Application error!</h1>
#<p>An application error occured!</p>

	m=[]
	aggressive_target = Target.new(@base_uri.to_s)
	aggressive_target.http_options={:method=>"POST", :data=>"whatweb=true"}
	aggressive_target.open
	# open_url

	unless aggressive_target.body.nil?
		if aggressive_target.body =~ /<h1>Application error!<\/h1>(\r\n|\n)<p>An application error occured!<\/p>/
			m << {:string=>"Invalid Post Method"}
		end
	end
	m 
end

end



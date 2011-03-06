##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##

# 0.1 
# detection works mainly for default installation state 
# tomatocms is based on zend framework
# v2.0 by Andrew Horton
# Added meta generator match and vendor matches. bug fixes. new random string function

Plugin.define "Zend" do
author "Aung Khant <http://yehg.net>"
version "0.2"
description "Zend PHP Framework (http://framework.zend.com/) and Zend Server (http://zend.com) Detection"

examples %w|
framework.zend.com
www.zend.com
http://andries.systray.be/zf-demos/feed-reader/feed/
www.survivethedeepend.com
demo.tomatocms.com
www.shoretotaloffice.com
|	


def randstr
 (0..8).map { (('a'..'z').to_a + (0..9).to_a).choice }.join
end 

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
{:text=>'<meta name="vendor" content="Zend Technologies'}

]

def http_request(target,method='post',post_data='whatweb')
	# follow 301's
	begin
		uri=URI.parse(target)
		path=uri.path
		path="/" if uri.path==""
		query=uri.query
		
		if $USE_PROXY == true
			http=Net::HTTP::Proxy($PROXY_HOST,$PROXY_PORT, $PROXY_USER, $PROXY_PASS).new(uri.host,uri.port)
		else
			http=Net::HTTP.new(uri.host,uri.port)
		end
		
		# set timeouts
		http.open_timeout = $HTTP_OPEN_TIMEOUT
		http.read_timeout = $HTTP_READ_TIMEOUT

		#puts path -- path doesn't include parameters
		
		# if it's https://
		# i wont worry about certificates, verfication, etc
		if uri.class == URI::HTTPS
			http.use_ssl = true	
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE		
		end
		case method
			when 'get'
			  req=Net::HTTP::Get.new(path + (query.nil? ? "" : "?" + query ) ,{"User-Agent"=>$USER_AGENT})
			when 'post'
			  req=Net::HTTP::Post.new(path ,{"User-Agent"=>$USER_AGENT})
			  req.set_form_data(post_data)	
		end 
		
		res=http.request(req)
		
		headers={}; res.each_header {|x,y| headers[x]=y }
		body=res.body
		status=res.code.to_i
		puts uri.host.to_s + path + (query.nil? ? "" : "?" + query ) + " [#{status}]" if  $verbose > 0 
		cookies=res.get_fields('set-cookie')
		
	rescue SocketError => err
		error(target + " ERROR: Socket error #{err}")
		return [0, nil, nil, nil,nil]
	rescue TimeoutError => err
		error(target + " ERROR: Timed out #{err}")
		return [0, nil, nil, nil,nil]
	rescue EOFError => err
		error(target + " ERROR: EOF error #{err}")
		return [0, nil, nil, nil,nil]
	rescue StandardError => err		
		err = "Cannot resolve hostname" if err.to_s == "undefined method `closed?' for nil:NilClass"
		error(target + " ERROR: #{err}")
		return [0, nil, nil, nil,nil]
	rescue => err
		error(target + " ERROR: #{err}")
		return [0, nil, nil, nil,nil]
	end


	begin		
		ip=IPSocket.getaddress(uri.host)
	rescue StandardError => err		
		err = "Cannot resolve hostname" if err.to_s == "undefined method `closed?' for nil:NilClass"
		error(target + " ERROR: #{err}")
		return [0, nil, nil, nil,nil]
	end

	[status,uri,ip,body,headers,cookies]
end

def passive
# X-Powered-By=Zend Framework
# X-Powered-By=Zend Framework 1.10
# Server: Zend Core/2.5.0
# X-Powered-By: Zend Core/2.5.0
      m=[]
      version = ''
      unless @meta.nil?
           
		unless @meta["x-powered-by"].nil?
		        if @meta["x-powered-by"] =~ /Zend Framework/i
				m << {:name=>'X-Powered-By'}
		        end
		        if @meta["x-powered-by"] =~ /Zend Framework ([a-zA-Z0-9\.\/\+\-\(\)]+)/i
				version = 'Framework: ' + @meta["x-powered-by"].scan(/Zend Framework ([a-zA-Z0-9\.\/\+\-\(\)]+)/i)[0].to_s
				m << {:version=>version}
		        end	
		
			if @meta["x-powered-by"] =~ /Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/i			
				version = 'Core: ' + @meta["x-powered-by"].scan(/Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/i)[0].to_s 
				m << {:version=>version}
			end
		end
	
		unless @meta["server"].nil?
			if @meta["server"] =~ /Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/i
				version = 'Core: ' + @meta["server"].scan(/Zend Core\/([a-zA-Z0-9\.\/\+\-\(\)]+)/i)[0].to_s 
				m << {:version=>version}
			end
		end
      end
     m
end

def aggressive
# when submiting invalid post to valid controller 
#<h1>Application error!</h1>
#<p>An application error occured!</p>

	m=[]
	target = URI.join(@base_uri.to_s).to_s
	status,url,ip,body,headers=http_request(target,'post')
	unless body.nil?
		if body =~ /<h1>Application error!<\/h1>(\r\n|\n)<p>An application error occured!<\/p>/ 	 
			m << {:string=>"Invalid Post Method"}
		end
	end	
	m 
end

end






##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Wordpress-Contact-Form" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-25
version "0.1"
description "WordPress Contact Form plugin - Contact Form 7 can manage multiple contact forms, plus you can customize the form and the mail contents flexibly with simple markup. The form supports Ajax-powered submitting, CAPTCHA, Akismet spam filtering and so on."
website "http://wordpress.org/extend/plugins/contact-form-7/"



matches [

# Version detection
{ :version=>/<input type="hidden" name="_wpcf([\d\.]+)" value="1" \/>/ }

]

# Version Detection # Default HTML form input
def passive
	m=[]

	if @body =~ /<input type="hidden" name="_wpcf([\d]+)_version" value="[\d\.]+" \/>/
		version=@body.scan(/<input type="hidden" name="_wpcf([\d]+)_version" value="([\d\.]+)" \/>/)[0][0]+"."+@body.scan(/<input type="hidden" name="_wpcf[\d]+_version" value="([\d\.]+)" \/>/)[0][0]
		m << { :version=>version }
	end

	m

end

end


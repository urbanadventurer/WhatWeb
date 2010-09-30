##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "eSyndiCat" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "eSyndiCat is a professional, affordable directory software solution. - homepage: http://www.esyndicat.com/"

# 8 results for "Powered by eSyndiCat Web Directory" @ 2010-08-08
examples %w|
www.esyndicat.com/demo/
www.esyndicat.com/demo/admin/
omega.esyndicat.com
omega.esyndicat.com/admin/
www.pornblogsdir.com
www.spiritueleforum.nl/links/
www.link2porno.net/pornolink/
www.seksdatabase.nl
|

matches [

{ :regexp=>/<div class="copyright">&copy; [0-9]{4}[\-0-9]* Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat[\ Web]* Directory [Script|Software]+<\/a><\/div>/ },

# Admin Panel
{ :text=>'	<title>Login To eSyndiCat Admin Panel</title>' },

]

# Version detection with meta generator and admin panel copyright footer text
def passive
        m=[]

        if @body =~ /	<meta name="generator" content="eSyndiCat Web Directory Software [\d\.]+" \/>/
                version=@body.scan(/	<meta name="generator" content="eSyndiCat Web Directory Software ([\d\.]+)" \/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /			Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat Pro v[\d\.]+<\/a><br \/>/
                version=@body.scan(/			Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat Pro v([\d\.]+)<\/a><br \/>/)[0][0]
                m << {:version=>version}
        end

        if @body =~ /	Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat<\/a> Version [\d\.]+<br \/>/
                version=@body.scan(/	Powered by <a href="http:\/\/www.esyndicat.com\/">eSyndiCat<\/a> Version ([\d\.]+)<br \/>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


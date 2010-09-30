##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Flax-Article-Manager" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-08-08
version "0.1"
description "Managing large dynamic websites has always been a difficult task for several webmasters, we have developed Flax Article Manager keeping you in mind. By using this system one can easily manage their news and/or articles quite easily. - homepage: http://www.flaxweb.com/products/articles"

examples %w|
www.articlesitedemo.com
www.articlesitedemo.com/admin/admin.php
www.aviationnews.us
www.aviationnews.us/admin/admin.php
www.findanexpertonline.com/FlaxArticlesManager/
www.findanexpertonline.com/FlaxArticlesManager/admin/admin.php
|

matches [

{ :text=>'/images/flaxweb_newsletter_bg.gif" bgcolor="#FFFFFF" valign="top"> ' },
{ :text =>'              <b><a href="http://www.flaxweb.com/products/articles"><font color="#666666">Article ' },

# Admin Panel
{ :text=>'<title>Flax Article CMS Administration Panel</title>' },
{ :text=>'              recent updates for Flax Article Manager</font></b></a></div>' },
{ :text=>'          <td width=67%><font color=#FFFFFF><a href=admin.php class=htext>Flax ' },

# 403 error text (/admin/ directory, for example)
{ :text=>'          <td><a href="http://www.flaxweb.com/products/articles">For more details about Flax article manager (CMS) please click ' },

]

# Version detection with copyright footer text
def passive
        m=[]

        if @body =~ /              Copyright [0-9]{4} &copy; Flax Article Manager v[\d\.]+<\/div>/
                version=@body.scan(/              Copyright [0-9]{4} &copy; Flax Article Manager v([\d\.]+)<\/div>/)[0][0]
                m << {:version=>version}
        end

        m

end


end


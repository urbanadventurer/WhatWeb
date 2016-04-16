##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "nopCommerce" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "nopCommerce is an open source e-commerce solution that contains both a catalog frontend and an administration tool backend. nopCommerce is a fully customizable shopping cart. It's stable and highly usable. "
website "http://www.nopcommerce.com/"

# Google results as at 2011-03-14 #
# 422 results for "powered by nopCommerce" "You have no items in your shopping cart."

# Dorks #
dorks [
'"powered by nopCommerce" "You have no items in your shopping cart."'
]



# Matches #
matches [

# GHDB
{ :certainty=>75, :ghdb=>'"powered by nopCommerce" "You have no items in your shopping cart."' },

# HTML Comment # Powered by
{ :text=>'<!--Powered by nopCommerce - http://www.nopCommerce.com-->' },

# If you have not purchased a valid "Copyright notice removal license" for nopCommerce, the copyright notice at the footer of your store must remain intact, unedited and clearly visible.

# Powered by link
{ :text=>'Powered by <a href="http://www.nopcommerce.com/">nopCommerce</a>' },

# Powered by link # target _blank
{ :text=>'Powered by <a href="http://www.nopcommerce.com" target="_blank">nopCommerce</a>' },

# Admin Page # Login Button
{ :text=>'<input type="submit" name="LoginForm$LoginButton" value="Log in" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;LoginForm$LoginButton&quot;, &quot;&quot;, true, &quot;LoginForm&quot;, &quot;&quot;, false, false))" id="LoginForm_LoginButton" class="adminButtonBlue" />' },

# Admin Page # Remember Me
{ :text=>'<input id="LoginForm_RememberMe" type="checkbox" name="LoginForm$RememberMe" checked="checked" /><label for="LoginForm_RememberMe">Remember me</label>' },

# Admin Page # JavaScript
{ :text=>'var LoginForm_UserNameOrEmailRequired = document.all ? document.all["LoginForm_UserNameOrEmailRequired"] : document.getElementById("LoginForm_UserNameOrEmailRequired");' },

]

end



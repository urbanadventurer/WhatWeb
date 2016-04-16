##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Contrexx-CMS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-06
version "0.1"
description "Contrexx CMS [Swiss]"
website "http://www.contrexx.com/"

# Google results as at 2011-03-06 #
# 28 for "Powered by Contrexx Software"

# Dorks #
dorks [
'"Powered by Contrexx Software"'
]



# Matches #
matches [

# Default Title
{ :text=>' - powered by Contrexx   Web Content Management System</title>' },

# Powered by text
{ :text=>'<p id="powered"><a href="http://www.contrexx.com/" title="Powered by Contrexx&reg; Software">Powered by Contrexx&reg; Software</a>' },
{ :text=>'<div class="footer_right">Powered by <a href="http://www.contrexx.com">Contrexx Software</a></div>' },

# Meta Generator
{ :text=>'<meta name="generator" content="Contrexx   Web Content Management System"/>' },

# StyleSheet
{ :text=>'<style type="text/css">@import url(core_modules/frontendEditing/css/style.css) all;</style>' },

# Admin Page # Default Title
{ :text=>'<title>Contrexx Administration Console</title>' },

# Admin Page # Submit Button
{ :text=>'		<td><input type="submit" tabindex="4" name="submit_button" value="Anmelden" onclick="if(this.disabled || typeof(this.disabled)==\'boolean\') this.disabled=true ; form_submitted_test=form_submitted ; form_submitted=true ; form_submitted=(!form_submitted_test || confirm(\'Are you sure you want to submit this form again?\')) ; if(this.disabled || typeof(this.disabled)==\'boolean\') this.disabled=false ; sub_form=\'\' ; return true" /></td>' },

]

end



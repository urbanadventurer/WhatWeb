##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MultiPowUpload" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-02-27
version "0.1"
description "MultiPowUpload is a Flash movie that has been created to replace the classic file uploading via Form in a browser. MultiPowUpload works in a >95% browsers and can also be placed on a web site easily. It offers lots of new possibilities that are not available during the usual upload via Form."
website "http://www.element-it.com/multiple-file-upload/flash-uploader.aspx"

# Google results as at 2011-02-27 #
# 5 for inurl:"FileProcessingScripts/PHP/uploadfiles.php"
# 11 for "Visit MultiPowUpload web site for new release and support information." intitle:"Element-It MultiPowUpload"

# Dorks #
dorks [
'"Visit MultiPowUpload web site for new release and support information." intitle:"Element-It MultiPowUpload"'
]



# Matches #
matches [

# FileProcessingScripts/PHP/uploadfiles.php
{ :text=>'Upload result:<br><pre>No files sent. Script is OK!Here is some more debugging info:Array' },

# Version Detection # Readme
{ :version=>/		<title>Element-It MultiPowUpload ([\d\.]+) Examples<\/title>/ },
{ :version=>/		<h2>Element-<font color="#de0000">It<\/font> MultiPowUpload ([\d\.]+) Examples<\/h2>/ },

# Support info link
{ :text=>'		Visit <a href="http://www.element-it.com/MultiPowUpload.aspx">MultiPowUpload</a> web site for new release and support information.' },
{ :text=>'		Visit <a href="http://www.element-it.com/multiple-file-upload/flash-uploader.aspx">MultiPowUpload</a> web site for new release and support information.' },

# Default param
{ :text=>'<PARAM NAME="FlashVars" VALUE="uploadUrl=FileProcessingScripts/PHP/uploadfiles.php' },

# Default embed tag
{ :text=>'<embed bgcolor=[^>]+src="ElementITMultiPowUpload.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"' },

# Version Detection # embed tag
{ :version=>/<embed bgcolor=[^>]+src="ElementITMultiPowUpload([\d\.]{1,5}).swf" quality="high" pluginspage="http:\/\/www.macromedia.com\/shockwave\/download\/index.cgi\?P1_Prod_Version=ShockwaveFlash"/ },

]

end



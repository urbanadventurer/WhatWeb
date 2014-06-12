##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Minify" do
author "Andrew Horton"
version "0.1"
description "Minify is a PHP5 app that can combine multiple CSS or Javascript files, compress their contents (i.e. removal of unnecessary whitespace/comments), and serve the results with HTTP encoding (gzip/deflate) and headers that allow optimal client-side caching. It uses an enhanced port of Douglas Crockford's JSMin library.  http://code.google.com/p/minify/"



# Matches #
matches [
{:name=>"script tag minify.php",
:regexp=>/<script[^>]+src=["'][^>]+\/minify.php\?[a-z]+=[^>]+["']/},

{:name=>"script tag /min/g=",
:certainty=>75,
:regexp=>/<script[^>]+src=["'][^>]*\/min\/g=[^>]+["']/},

{:name=>"script tag /min/js?",
:certainty=>75,
:regexp=>/<script[^>]+src=["'][^>]*\/min\/js\?[^>]+["']/}
]

=begin

this plugin is weak, needs more examples

<link type="text/css" rel="stylesheet" href="/min/b=wp-content&amp;f=chili/recipes.css,themes/orangesky/style.css" media="screen" />
<script type="text/javascript" src="/min/g=js"></script>


<link rel="stylesheet" type="text/css" href="/min/css?1206756916">
<script type="text/javascript" src="/min/js?1206756916"></script>

<script type="text/javascript" src="http://tags.gawker.com/assets/minify.php?base=/assets/base.v8/js/&files=jquery-1.3.2.js,jquery.json-1.3.min.js,clientside/gawker.jquery-1.3.2.js,clientside/jquery-ui-1.7.1.custom.min.js,jquery.at_intervals.js&rev=28005"></script>
<script type="text/javascript" src="http://tags.gawker.com/assets/minify.php?base=/assets/base.v8/js/&fsid=15&type=js&sb=base.v8&rev=28005"></script>
<script type="text/javascript" src="http://tags.gawker.com/assets/minify.php?base=/assets/bas
e.v8/js/clientside/&files=gawker.prototype.js,gawker.Message.js,gawker.Base.js,gawker.XHR.js,gawker.Widget.js,gawker.clientsi
de.js,gawker.Validator.js,gawker.settings.Validator.js,gawker.Widget.BuddyToggle.js,gawker.settings.BuddyToggle.js,gawker.Wid
get.EditorControls.js,gawker.settings.EditorControls.js,gawker.Widget.GalleryPager.js,gawker.settings.GalleryPager.js,gawker.
Widget.GawkerAuth.js,gawker.settings.GawkerAuth.js,gawker.Widget.Login.js,gawker.settings.Login.js,gawker.Widget.Logout.js,ga
wker.settings.Logout.js,gawker.Widget.PostClip.js,gawker.settings.PostClip.js,gawker.Widget.Profile.js,gawker.settings.Profil
e.js,gawker.Widget.ProfileEditor.js,gawker.settings.ProfileEditor.js,gawker.Widget.PromoteTweet.js,gawker.settings.PromoteTweet.js,gawker.Widget.Rating.js,gawker.settings.Rating.js,gawker.Widget.Register.js,gawker.settings.Register.js,gawker.Widget.Replycount.js,gawker.settings.Replycount.js,gawker.Widget.ResetPassword.js,gawker.settings.ResetPassword.js,gawker.Widget.StatusUpdate.js,gawker.settings.StatusUpdate.js,gawker.Widget.StarInvite.js,gawker.settings.StarInvite.js,settings.js,gawker.PageController.js,controller.frontpage.js&rev=28005"></script>
<link rel="stylesheet" href="http://tags.gawker.com/assets/minify.php?base=/assets/base.v8/css/&fsid=16383&type=css&sb=base.v8&rev=28005" />
<link rel="stylesheet" href="http://tags.gawker.com/assets/minify.php?files=/assets/g4.gawker.com/css/style.css,/assets/_takeover/prius.gawker.com/css/style.css&rev=28005" />




<script type="text/javascript" src="http://tags.gizmodo.com/assets/minify.php?base=/assets/base.v8/js/&files=jquery-1.3.2.js,jquery.json-1.3.min.js,clientside/gawker.jquery-1.3.2.js,clientside/jquery-ui-1.7.1.custom.min.js,jquery.at_intervals.js&rev=28005"></script>
<script type="text/javascript" src="http://tags.gizmodo.com/assets/minify.php?base=/assets/base.v8/js/&fsid=15&type=js&sb=base.v8&rev=28005"></script>
<script type="text/javascript" src="http://tags.gizmodo.com/assets/minify.php?base=/assets/base.v8/js/clientside/&files=gawker.prototype.js,gawker.Message.js,gawker.Base.js,gawker.XHR.js,gawker.Widget.js,gawker.clientside.js,gawker.Validator.js,gawker.settings.Validator.js,gawker.Widget.BuddyToggle.js,gawker.settings.BuddyToggle.js,gawker.Widget.EditorControls.js,gawker.settings.EditorControls.js,gawker.Widget.GalleryPager.js,gawker.settings.GalleryPager.js,gawker.Widget.GawkerAuth.js,gawker.settings.GawkerAuth.js,gawker.Widget.Login.js,gawker.settings.Login.js,gawker.Widget.Logout.js,gawker.settings.Logout.js,gawker.Widget.PostClip.js,gawker.settings.PostClip.js,gawker.Widget.Profile.js,gawker.settings.Profile.js,gawker.Widget.ProfileEditor.js,gawker.settings.ProfileEditor.js,gawker.Widget.PromoteTweet.js,gawker.settings.PromoteTweet.js,gawker.Widget.Rating.js,gawker.settings.Rating.js,gawker.Widget.Register.js,gawker.settings.Register.js,gawker.Widget.Replycount.js,gawker.settings.Replycount.js,gawker.Widget.ResetPassword.js,gawker.settings.ResetPassword.js,gawker.Widget.StatusUpdate.js,gawker.settings.StatusUpdate.js,gawker.Widget.StarInvite.js,gawker.settings.StarInvite.js,settings.js,gawker.PageController.js,controller.frontpage.js&rev=28005"></script>
<link rel="stylesheet" href="http://tags.gizmodo.com/assets/minify.php?base=/assets/base.v8/css/&fsid=24575&type=css&sb=base.v8&rev=28005" />
<link rel="stylesheet" href="http://tags.gizmodo.com/assets/minify.php?files=/assets/g4.gizmodo.com/css/style.css,/assets/_takeover/prius.gizmodo.com/css/style.css&rev=28005" />

=end




end



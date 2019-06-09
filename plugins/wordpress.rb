##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "WordPress"
authors [
  "Andrew Horton",
  # v0.3 # Now using :version=>// instead of a passive function, added description, examples and included relative /wp-content/ link detection. 
  # v0.4 # 2011-04-06 # Added aggressive md5 matches. 
  # v0.5 # 2012-03-05 # Added regex version detection for /readme.html. 
  # v0.6 # 2012-03-05 # Added regex version detection for /readme.html. 
  "@SlivTaMere", # v0.7 # 2016-10-25 # Added "wp-includes" and "wp-json" in href and src detection.. 
  "@anoroozian", # v0.8 # 2016-12-16 # Aggressive version detection matches 4.0 -> 4.0-beta4. Plugin format update. 
  "@ajgon", # v0.9 # 2019-01-19 # @ajgon (Igor Rzegocki) # Updated version detection list from Wordpress 3.9.1 to 5.0.2.
]
version "0.9"
description "WordPress is an opensource blogging system commonly used as a CMS."
website "http://www.wordpress.org/"

# Dorks #
dorks [
  '"is proudly powered by WordPress"'
]

# Matches #
matches [
       
       {:text=>'<meta name="generator" content="WordPress.com" />'},
       {:text=>'<a href="http://www.wordpress.com">Powered by WordPress</a>', :name=>'powered by link'},
       {:text=>"<link rel='https://api.w.org/'", :name=>'REST API link'},

       {:regexp=>/"[^"]+\/wp-content\/[^"]+"/, :name=>"wp-content", :certainty=>75 },
       
       {:version=>/<meta name="generator" content="WordPress ([0-9\.]+)"/ },
       
       # url exists, i.e. returns HTTP status 200
       {:url=>"/wp-cron.php"},
       
       #{:url=>"/admin/", :full=>true }, # full means that whatweb will run all plugins against this url - this isn't yet implemented as of 0.4.7
       
       # /wp-login.php  exists & contains a string
       {:url=>"/wp-login.php", :text=>'<a title="Powered by WordPress" href="http://wordpress.org/">'},
       {:url=>"/wp-login.php", :text=>'<a href="http://wordpress.org/" title="Powered by WordPress">', :name=>'wp3 login page'},
       {:url=>"/wp-login.php", :text=>'action=lostpassword'},
       
       {:url=>"/wp-login.php", :tagpattern=>"!doctype,html,head,title,/title,meta,link,link,script,/script,meta,/head,body,div,h1,a,/a,/h1,form,p,label,br,input,/label,/p,p,label,br,input,/label,/p,p,label,input,/label,/p,p,input,input,input,/p,/form,p,a,/a,/p,p,a,/a,/p,/div,script,/script,/body,/html"}, #note that WP plugins can add script tags. tags are delimited by commas so we can count how close it is
       {:url=>"favicon.ico", :md5=>'f420dc2c7d90d7873a90d82cd7fde315'}, # not common, seen on http://s.wordpress.org/favicon.ico
       {:url=>"favicon.ico", :md5=>'fa54dbf2f61bd2e0188e47f5f578f736', :name=>'WordPress.com favicon'},  # on wordpress.com blogs  http://s2.wp.com/i/favicon.ico
       
       {:url=>"/readme.html", :version=>/<h1.*WordPress.*Version ([0-9a-z\.]+).*<\/h1>/m}
       
      ]
  

# Passive #
passive do
  m = []

  # detect /wp-content/ on this site but don't be confused by links to other sites.
  # <link rel="stylesheet" href="http://bestwebgallery.com/wp-content/themes/master/style.css" type="text/css" />

  if @body =~ %r{(href|src)="[^"]*/wp-content/[^"]*}
    # is it a relative link or on the same site?
    links = @body.scan(%r{(href|src)="([^"]*/wp-content/[^"]*)}).map { |x| x[1].strip }.flatten
    links.each do |thislink|
      # join this link wtih target, check if host part is ==, if so, it's relative
      joined_uri = URI.join(@base_uri.to_s, thislink)

      next unless joined_uri.host == @base_uri.host

      # puts "yes, #{joined_uri.to_s} is relative to #{@base_uri.to_s}"
      m << { name: 'Relative /wp-content/ link' }
      break
    end
  end

  if @body =~ /(href|src)="[^"]*\/wp-includes\/[^"]*/
    # is it a relative link or on the same site?
    links= @body.scan(/(href|src)="([^"]*\/wp-includes\/[^"]*)/).map {|x| x[1].strip }.flatten
    links.each do |thislink|
      # join this link wtih target, check if host part is ==, if so, it's relative
      joined_uri=URI.join(@base_uri.to_s,thislink)

      if joined_uri.host == @base_uri.host
        #puts "yes, #{joined_uri.to_s} is relative to #{@base_uri.to_s}"
        m << {:name=>"Relative /wp-includes/ link" }
        break
      end
    end
  end

  if @body =~ /(href|src)="[^"]*\/wp-json\/[^"]*/
    # is it a relative link or on the same site?
    links= @body.scan(/(href|src)="([^"]*\/wp-json\/[^"]*)/).map {|x| x[1].strip }.flatten
    links.each do |thislink|
      # join this link wtih target, check if host part is ==, if so, it's relative
      joined_uri=URI.join(@base_uri.to_s,thislink)

      if joined_uri.host == @base_uri.host
        #puts "yes, #{joined_uri.to_s} is relative to #{@base_uri.to_s}"
        m << {:name=>"Relative /wp-json/ link" }
        break
      end
    end
  end

  # Return passive matches
  m
end



# Aggressive #
aggressive do
  m = []

  # the paths are relative to the url path if they don't start with /
  # this path, with this md5 = this version

  versions = Hash[
                  '0.71-gold' =>
                  [['readme.html',
                    '0c1e4a01d4ccf6dbedda30bf3c5eeb9e'],
                   ['b2-include/xmlrpc.inc',
                    '14524c5d7f9f72394e04512d9941bc50']],
                  '0.72-rc1' =>
                  [['readme.html',
                    'dacf325336ae55fffbcd54bd08de55b4'],
                   ['wp-layout.css',
                    'dc04833fd754c0b404ec157e0bb8e7ae']],
                  '0.72-beta1' =>
                  [['readme.html',
                    'dacf325336ae55fffbcd54bd08de55b4'],
                   ['wp-layout.css',
                    '7edb4d6b89b4625f6e6c6b9e5cd589b6']],
                  '1.0-rc1' =>
                  [['readme.html',
                    '613b5eca59267b5b62b6e81dd9536b1b'],
                   ['wp-sitetemplates/main/templates/top.html',
                    '120ca99e1b816915e0f27152b7d24a75']],
                  '1.0-platinium' =>
                  [['readme.html',
                    '6e08f4bfb7f79de78a3278f0f4ad981f']],
                  '1.0.1-rc1' =>
                  [['readme.html',
                    '11f6a057f13e9413edc98e4614230622']],
                  '1.0.1-miles' =>
                  [['readme.html',
                    '7ccd56b1c5b7123ed9afb222e6e93924']],
                  '1.0.2' =>
                  [['readme.html',
                    'c91375254e9f56e45939ffcc28424c72']],
                  '1.0.2-blakey' =>
                  [['readme.html',
                    'c91375254e9f56e45939ffcc28424c72']],
                  '1.2-rc1' =>
                  [['readme.html',
                    '790736d62d442117f9d28b64161919a2']],
                  '1.2-rc2' =>
                  [['readme.html',
                    '790736d62d442117f9d28b64161919a2']],
                  '1.2-beta' =>
                  [['readme.html',
                    '790736d62d442117f9d28b64161919a2'],
                   ['wp-layout.css',
                    'c3f4bd5f3146770c0cba45b10c385047']],
                  '1.2-delta' =>
                  [['readme.html',
                    '790736d62d442117f9d28b64161919a2'],
                   ['wp-layout.css',
                    '1bcc9253506c067eb130c9fc4f211a2f']],
                  '1.2-mingus' =>
                  [['readme.html',
                    '6c3c457ed408be44244edc121cada9a2']],
                  '1.2.1' =>
                  [['readme.html',
                    '75eaf1c4b267e11fffd42c34e8832567'],
                   ['wp-layout.css',
                    '7140e06c00ed03d2bb3dad7672557510']],
                  '1.2.2' =>
                  [['readme.html',
                    '6c3c457ed408be44244edc121cada9a2'],
                   ['wp-includes/js/scriptaculous/scriptaculous.js',
                    'd72a1c859799b4e1355ff65e4a1ad148']],
                  '1.5-strayhorn' =>
                  [['readme.html',
                    'aaa2d12586d9632c76b7b7f03d58a9f6']],
                  '1.5.1' =>
                  [['readme.html',
                    'c60692ee8e176db0ac0be5ca69ba6c24']],
                  '1.5.1.1' =>
                  [['readme.html',
                    'c60692ee8e176db0ac0be5ca69ba6c24']],
                  '1.5.1.2' =>
                  [['readme.html',
                    'c60692ee8e176db0ac0be5ca69ba6c24']],
                  '1.5.1.3' =>
                  [['readme.html',
                    'aaa2d12586d9632c76b7b7f03d58a9f6']],
                  '1.5.2' =>
                  [['readme.html',
                    'aaa2d12586d9632c76b7b7f03d58a9f6']],
                  '2.0' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842'],
                   ['wp-content/themes/default/style.css',
                    'f786f66d3a40846aa22dcdfeb44fa562']],
                  '2.0.1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.1-rc1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.4' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.5' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.5-rc1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.5-beta1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.6' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.6-rc1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.7' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.7-rc1' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.7-rc2' =>
                  [['readme.html',
                    '010ac2a095f4d30b2a650b94cf3f8842']],
                  '2.0.8' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.8-rc1' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.9' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.9-rc1' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.9-beta' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.10' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.10-rc1' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.10-rc2' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.10-rc3' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.11' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.11-rc1' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.11-rc2' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.0.11-rc3' =>
                  [['readme.html',
                    'ec9a2ffad38a3f0185aa6d9c0b8d6673']],
                  '2.1' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1-rc1' =>
                  [['readme.html',
                    '1808e8f88b490dffdfe0e3ea0a951e86']],
                  '2.1-rc2' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1-beta1' =>
                  [['readme.html',
                    '33228916bae952810ca10a09b23bc366']],
                  '2.1-beta2' =>
                  [['readme.html',
                    '0bb72a5175266c98406b8b42a31114de']],
                  '2.1-beta3' =>
                  [['readme.html',
                    '1808e8f88b490dffdfe0e3ea0a951e86'],
                   ['wp-includes/js/tinymce/plugins/inlinepopups/editor_plugin.js',
                    '527706a40c4a6939c1a47db7a6c4dbaf']],
                  '2.1-beta4' =>
                  [['readme.html',
                    '1808e8f88b490dffdfe0e3ea0a951e86']],
                  '2.1.1' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.1-rc1' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.1-beta' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.2' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.3' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.3-rc1' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.3-rc2' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.1.3-rc3' =>
                  [['readme.html',
                    'a5bc745849e1971abf8efb9a135ce764']],
                  '2.2' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2-rc1' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2-rc2' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2.1' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2.1-rc1' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2.1-rc2' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2.2' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.2.3' =>
                  [['readme.html',
                    '939a797929aec1b8e0039014e9a29433']],
                  '2.3' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3-rc1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3-beta1' =>
                  [['readme.html',
                    '0384d4bdace37e066df6bb7a85b009aa']],
                  '2.3-beta2' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3-beta3' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.1-rc1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.1-beta1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.2' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.2-rc1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.2-beta1' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.2-beta2' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.2-beta3' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.3.3' =>
                  [['readme.html',
                    '95803b846df1873416ee96c1577b3adf']],
                  '2.5' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483']],
                  '2.5-rc1' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/autosave.js',
                    'c2fa52e7e956c340da6e2d2d86694cee']],
                  '2.5-rc2' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/autosave.js',
                    'd275157ac090ce476b4914505f8de24f']],
                  '2.5-rc3' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483']],
                  '2.5.1' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/tinymce/tiny_mce.js',
                    'a3d05665b236944c590493e20860bcdb']],
                  '2.6' =>
                  [['readme.html',
                    '5bca147a86a1d277328c298ab06b772b']],
                  '2.6-rc1' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483']],
                  '2.6-beta1' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/tinymce/tiny_mce.js',
                    '35f98a53dd50907c60b872213da50deb']],
                  '2.6-beta2' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/tinymce/plugins/wpeditimage/editimage.html',
                    '48a67e901144ce41af63c8e7d680ac74']],
                  '2.6-beta3' =>
                  [['readme.html',
                    'c3024b888aeb1539f4c29df7b166d483'],
                   ['wp-includes/js/tinymce/plugins/wpeditimage/editimage.html',
                    'e1e9459af693c6076a6d99997d851ab4']],
                  '2.6.1' =>
                  [['readme.html',
                    '0377751ad219ccbb809d527952ff7325']],
                  '2.6.1-beta1' =>
                  [['readme.html',
                    '5bca147a86a1d277328c298ab06b772b'],
                   ['wp-includes/js/tinymce/plugins/wpeditimage/editimage.html',
                    'cb6e865aa733445c260ac01899542756']],
                  '2.6.1-beta2' =>
                  [['readme.html',
                    '5bca147a86a1d277328c298ab06b772b']],
                  '2.6.2' =>
                  [['readme.html',
                    '0377751ad219ccbb809d527952ff7325']],
                  '2.6.3' =>
                  [['readme.html',
                    '0377751ad219ccbb809d527952ff7325']],
                  '2.6.5' =>
                  [['readme.html',
                    '0377751ad219ccbb809d527952ff7325']],
                  '2.7' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.7-rc1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133'],
                   ['wp-includes/js/swfupload/handlers.js',
                    'a16a9cb39d37486aeacd3b2e1701f6aa']],
                  '2.7-rc2' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.7-beta1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133'],
                   ['wp-includes/js/autosave.js',
                    '9ceecef42a279029e0f97b4def8e542b']],
                  '2.7-beta2' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133'],
                   ['wp-includes/js/autosave.js',
                    'c1ea7016092c130a51a44ffe232bc7c9']],
                  '2.7-beta3' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133'],
                   ['wp-includes/js/tinymce/tiny_mce.js',
                    'f73b7c82ff78af24cd7563862084000a']],
                  '2.7.1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.7.1-rc1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.8' =>
                  [['readme.html',
                    '4a64408bdaaa6c8af7cab9346f0ce380']],
                  '2.8-rc1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.8-beta1' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.8-beta2' =>
                  [['readme.html',
                    '94c4cdfa20778d1bf9784941f9fca133']],
                  '2.8.1' =>
                  [['readme.html',
                    '7ed95e0b7ae663cbd0a8e77d787a4637']],
                  '2.8.1-rc1' =>
                  [['readme.html',
                    '4a64408bdaaa6c8af7cab9346f0ce380']],
                  '2.8.1-beta1' =>
                  [['readme.html',
                    '4a64408bdaaa6c8af7cab9346f0ce380'],
                   ['wp-includes/js/autosave.js',
                    '40f836bb6cf8fa6007aa2bd335754590']],
                  '2.8.1-beta2' =>
                  [['readme.html',
                    '4a64408bdaaa6c8af7cab9346f0ce380'],
                   ['wp-includes/js/autosave.js',
                    '8e58ac561fd6f038843395e7e18fbb0f']],
                  '2.8.2' =>
                  [['readme.html',
                    'ef8665ddd2d87badccb3532705b95992'],
                   ['wp-content/plugins/akismet/readme.txt',
                    '48c52025b5f28731e9a0c864c189c2e7']],
                  '2.8.3' =>
                  [['readme.html',
                    'de32a1268d126ea71127ad5f9fa8f60d']],
                  '2.8.4' =>
                  [['readme.html',
                    '7d93c7feb3e2e2c2112474f92e3ee6f8']],
                  '2.8.5' =>
                  [['readme.html',
                    'f32252ef12c927f6285e4fb29efce04f']],
                  '2.8.5-beta1' =>
                  [['readme.html',
                    'f32252ef12c927f6285e4fb29efce04f']],
                  '2.8.6' =>
                  [['readme.html',
                    '027283d03b08abae67279fd17a37760b']],
                  '2.8.6-beta1' =>
                  [['readme.html',
                    '027283d03b08abae67279fd17a37760b']],
                  '2.9' =>
                  [['readme.html',
                    '1eaf3b4f4c2d039d26a473c0e0b5622e']],
                  '2.9-rc1' =>
                  [['readme.html',
                    'f182f41b25a96a12c393e35d9d063ed4']],
                  '2.9-beta1' =>
                  [['readme.html',
                    'f182f41b25a96a12c393e35d9d063ed4'],
                   ['wp-includes/js/swfupload/handlers.js',
                    '67c19dd1aa288610db84ef258e0fde22']],
                  '2.9-beta2' =>
                  [['readme.html',
                    'f182f41b25a96a12c393e35d9d063ed4'],
                   ['wp-includes/js/swfupload/handlers.js',
                    '829d0ee86744a34049329f5c461d12d0']],
                  '2.9.1' =>
                  [['readme.html',
                    '80c4ecc8630395baeb7363a7cf4dad33']],
                  '2.9.1-rc1' =>
                  [['readme.html',
                    '80c4ecc8630395baeb7363a7cf4dad33']],
                  '2.9.1-beta1' =>
                  [['readme.html',
                    '1eaf3b4f4c2d039d26a473c0e0b5622e']],
                  '2.9.2' =>
                  [['readme.html',
                    '6cfb514bbb51d883bb6fece65d5fd450'],
                   ['wp-content/themes/home/rtl.css',
                    '64231a50358031e1d92bb02ffcc5579d']],
                  '3.0' =>
                  [['readme.html',
                    '9ea06ab0184049bf4ea2410bf51ce402'],
                   ['wp-content/themes/twentyten/languages/twentyten.pot',
                    '2ea37779cc9cbfc274f1a0273a6ea1b5']],
                  '3.0-rc1' =>
                  [['readme.html',
                    '9ea06ab0184049bf4ea2410bf51ce402'],
                   ['wp-content/themes/twentyten/style.css',
                    '5e86e1dd9c095c1bf8ea8e5ec53bee1e']],
                  '3.0-rc2' =>
                  [['readme.html',
                    '9ea06ab0184049bf4ea2410bf51ce402'],
                   ['wp-content/themes/twentyten/style.css',
                    '23fd2a602c38ec4c611559fb1552afcd']],
                  '3.0-rc3' =>
                  [['readme.html',
                    '9ea06ab0184049bf4ea2410bf51ce402'],
                   ['wp-content/themes/twentyten/languages/twentyten.pot',
                    '497963f44fb84e2c7d425c1fd4eed76e']],
                  '3.0-beta1' =>
                  [['readme.html',
                    'b051ca0b7f06618784dd286da1b3ce95'],
                   ['wp-includes/js/autosave.js',
                    'a27e28943c0ce3e0438c03c83092c919']],
                  '3.0-beta2' =>
                  [['readme.html',
                    '9ea06ab0184049bf4ea2410bf51ce402'],
                   ['wp-includes/js/autosave.js',
                    '46149fb60863c31931ba3b4c2698bff4']],
                  '3.0.1' =>
                  [['readme.html',
                    'a73cac84b8b9a99377917a6974c9eea2']],
                  '3.0.2' =>
                  [['readme.html',
                    '0538342b887f11ed4a306d3e7c7d6ea7']],
                  '3.0.3' =>
                  [['readme.html',
                    '0eb4f7981c3de98df925b3020c147a61']],
                  '3.0.4' =>
                  [['readme.html',
                    'c7a01d814ffbbb790ee5f4f8f3631903']],
                  '3.0.5' =>
                  [['readme.html',
                    'ed20f283f2c1b775219bdb12e5c6ba93']],
                  '3.0.6' =>
                  [['readme.html',
                    '45119882b8d576a3462f76708b6bc1c5']],
                  '3.1' =>
                  [['readme.html',
                    'f01635ffca23e49e01f47e98553ea75d']],
                  '3.1-rc1' =>
                  [['readme.html',
                    'd48f95db161328051787e2f427148f4a'],
                   ['wp-content/themes/twentyten/languages/twentyten.pot',
                    '0aac287d00db838d3bc01a1d6d621d2f']],
                  '3.1-rc2' =>
                  [['readme.html',
                    'd48f95db161328051787e2f427148f4a'],
                   ['wp-content/themes/twentyten/style.css',
                    '150c80e23ce93ebced5035e00e4d864b']],
                  '3.1-rc3' =>
                  [['readme.html',
                    'f01635ffca23e49e01f47e98553ea75d'],
                   ['wp-includes/css/admin-bar-rtl.css',
                    'c032baf7fa4ed30d82b46946f75cbc69']],
                  '3.1-rc4' =>
                  [['readme.html',
                    'f01635ffca23e49e01f47e98553ea75d']],
                  '3.1-beta1' =>
                  [['readme.html',
                    '7a8b02d6ce7229e33bd64da8bef83ad7'],
                   ['wp-includes/css/admin-bar.css',
                    'd858495789b9a37ef8651f54a9f2e12b']],
                  '3.1-beta2' =>
                  [['readme.html',
                    'd48f95db161328051787e2f427148f4a'],
                   ['wp-includes/css/admin-bar.css',
                    '912a71bf5137e3a06911d1ebd855c2b7']],
                  '3.1.1' =>
                  [['readme.html',
                    '5be6140fc3f44126b476dfff5bc0c658']],
                  '3.1.1-rc1' =>
                  [['readme.html',
                    '5be6140fc3f44126b476dfff5bc0c658']],
                  '3.1.2' =>
                  [['readme.html',
                    '20f882b08b2804bc7431c0866a8999d1']],
                  '3.1.3' =>
                  [['readme.html',
                    'ccc403368e01b3c3b0caf28079a710a5']],
                  '3.1.4' =>
                  [['readme.html',
                    'fbebf5899944a9d7aedd00250bb71745'],
                   ['wp-content/themes/twentyten/languages/twentyten.pot',
                    '0702faf14edacb91bb82681870cb6da0']],
                  '3.2' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e']],
                  '3.2-rc1' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e'],
                   ['wp-content/themes/twentyeleven/style.css',
                    '5a13b9234881621dca42f9430bfdd885']],
                  '3.2-rc2' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e'],
                   ['wp-content/themes/twentyeleven/style.css',
                    '31156206fec3debcc2f9b844ef83d9e1']],
                  '3.2-rc3' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e'],
                   ['wp-content/themes/twentyeleven/style.css',
                    '81b2771858d8ab1ed3ae13d8d5866561']],
                  '3.2-beta1' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e'],
                   ['wp-includes/js/autosave.js',
                    '3bf40ac97632994f5ee6d8d4fc72f0d3']],
                  '3.2-beta2' =>
                  [['readme.html',
                    '573e79628d2ee07670e889569059669e'],
                   ['wp-includes/js/tinymce/plugins/wordpress/editor_plugin.js',
                    '708373211fb001cba51de1138ff9e748']],
                  '3.2.1' =>
                  [['readme.html',
                    '98d3f05ff1e321dbd58ad154cc95e569']],
                  '3.3' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a']],
                  '3.3-rc1' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    '304a1620b044cc58cef73349359943b3']],
                  '3.3-rc2' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    '9bb37fe637ee3a53d9274fd2d0301260']],
                  '3.3-rc3' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a']],
                  '3.3-beta1' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    '7d21a462f3b5d5b9ad1f878c45f78e92']],
                  '3.3-beta2' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    'e8af3c520f06153ad674eebd7453971e']],
                  '3.3-beta3' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    'a30deaec087f1eab3183a2b9d50cd19b']],
                  '3.3-beta4' =>
                  [['readme.html',
                    'e0f97110b60c3a3c71dcd1d4d923495a'],
                   ['wp-includes/css/admin-bar.css',
                    '4e6bda0b7acff641f480c4fd5d5b6910']],
                  '3.3.1' =>
                  [['readme.html',
                    'c1ed266e26a829b772362d5135966bc3']],
                  '3.3.2' =>
                  [['readme.html',
                    '628419c327ca5ed8685ae3af6f753eb8']],
                  '3.3.2-rc1' =>
                  [['readme.html',
                    '628419c327ca5ed8685ae3af6f753eb8']],
                  '3.3.3' =>
                  [['readme.html',
                    '36b2b72a0f22138a921a38db890d18c1']],
                  '3.4' =>
                  [['readme.html',
                    '34b3071c2c48f0b1a611c2ee9f1b3516']],
                  '3.4-rc1' =>
                  [['readme.html',
                    '34b3071c2c48f0b1a611c2ee9f1b3516'],
                   ['wp-includes/js/customize-preview.js',
                    '453a5ccf234fb8d8ce360aca3672ed95']],
                  '3.4-rc2' =>
                  [['readme.html',
                    '34b3071c2c48f0b1a611c2ee9f1b3516'],
                   ['wp-includes/js/customize-preview.js',
                    '7b1408a3cd59c8287efa8c02bd43356e']],
                  '3.4-rc3' =>
                  [['readme.html',
                    '34b3071c2c48f0b1a611c2ee9f1b3516']],
                  '3.4-rc4' =>
                  [['readme.html',
                    '34b3071c2c48f0b1a611c2ee9f1b3516']],
                  '3.4-beta1' =>
                  [['readme.html',
                    '8df86e1e534c349747292e0b56531f63'],
                   ['wp-includes/js/tinymce/tiny_mce.js',
                    '078bd9e2c8fa7b6c2ab231183f6ee2cb']],
                  '3.4-beta2' =>
                  [['readme.html',
                    '8df86e1e534c349747292e0b56531f63']],
                  '3.4-beta3' =>
                  [['readme.html',
                    '8df86e1e534c349747292e0b56531f63'],
                   ['wp-includes/js/customize-preview.js',
                    'e28df79d5eb55f26b46ae88bafadc2b9']],
                  '3.4-beta4' =>
                  [['readme.html',
                    '8df86e1e534c349747292e0b56531f63'],
                   ['wp-includes/js/customize-preview.js',
                    'a8a259fc5197a78ffe62d6be38dc52f8']],
                  '3.4.1' =>
                  [['readme.html',
                    '9ecbb128295ac324f63a6adc0b6e78ea'],
                   ['wp-includes/js/customize-preview.js',
                    '617d9fd858e117c7d1d087be168b5643']],
                  '3.4.2' =>
                  [['readme.html', 'c6514a15e04bd9ec96df4d9b78c17bc5'],
                   ['wp-includes/js/customize-preview.js', '617d9fd858e117c7d1d087be168b5643'],
                   ['/wp-admin/css/wp-admin.css', 'dc906af62607ada3fe2baac62ac3cceb']],
                  '3.5' =>
                  [['readme.html', '066cfc0f9b29ae6d491aa342ebfb1b71'],
                   ['wp-admin/css/wp-admin.css', 'c8c02c7d0318ddeb985e324f126a19e8']],
                  '3.5.1' =>
                  [['readme.html', '05d50a04ef19bd4b0a280362469bf22f'],
                   ['wp-admin/css/wp-admin.css', '1906ac1bed40e0c5c7de71f2bc42dc20']],
                  '3.5.2' =>
                  [['readme.html', 'caf7946275c3e885419b1d36b22cb5f3'],
                   ['wp-admin/css/wp-admin.css', '1906ac1bed40e0c5c7de71f2bc42dc20']],
                  '3.6' =>
                  [['readme.html', '477f1e652f31dae76a38e3559c91deb9'],
                   ['wp-admin/css/wp-admin.css', '25dd20710bf1eec392a00fc892b63fde']],
                  '3.6.1' =>
                  [['readme.html', 'e82f4fe7d3c1166afb4c00856b875f16'],
                   ['wp-admin/css/wp-admin.css', '25dd20710bf1eec392a00fc892b63fde']],
                  '3.7' =>
                  [['readme.html', '4717bf89e299ff054760ec8b0768c9e1'],
                   ['wp-admin/css/wp-admin.css', 'f0894fa9c9733d0e577fc5beddc726cd']],
                  '3.7.1' =>
                  [['readme.html', '4717bf89e299ff054760ec8b0768c9e1'],
                   ['wp-admin/css/wp-admin.css', 'f0894fa9c9733d0e577fc5beddc726cd']],
                  '3.8' =>
                  [['readme.html', '38ee273095b8f25b9ffd5ce5018fc4f0'],
                   ['wp-admin/css/wp-admin.css', '25554fc81989c307119b7d4818dc3963']],
                  '3.8.1' =>
                  [['readme.html', '0d0eb101038124a108f608d419387b92'],
                   ['wp-admin/css/wp-admin.css', '68600417d5dc22244168b4eeb84f0af4']],
                  '3.8.2' =>
                  [['readme.html', 'e01a2663475f6a7a8363a7c75a73fe23'],
                   ['wp-admin/css/wp-admin.css', '68600417d5dc22244168b4eeb84f0af4']],
                  '3.8.3' =>
                  [['readme.html', 'c6de8fc70a18be7e5c36198cd0f99a64'],
                   ['wp-admin/css/wp-admin.css', '68600417d5dc22244168b4eeb84f0af4']],
                  '3.9' =>
                  [['wp-includes/css/editor.css', '9ed346f17ea5f8a7d4f30d96003de9b1'],
                   ['readme.html', '84b54c54aa48ae72e633685c17e67457']],
                  '3.9.1' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'cdbf9b18e3729b3553437fc4e9b6baad']],
                  '3.9.2' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'dfb2d2be1648ee220bf9bd3c03694ed8']],
                  '3.9.3' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '62a78170a740a4460a8d25e00c1839f5']],
                  '3.9.4' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '38466bbd5205e09d8bbb4e46bfd4aec5']],
                  '3.9.5' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '57b9f0931f2da4389af92e07bc702505']],
                  '3.9.6' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '2e7463a0999c6495b6d1c79a48c81d46']],
                  '3.9.7' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '1a6acdaa1de27568ce672ff9748914e0']],
                  '3.9.8' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'c4371f9433505dd8cea5f03bf5e6c328']],
                  '3.9.9' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '87f4b1dd4ea5e17b30233722077adb0c']],
                  '3.9.10' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'd517492c730895ce405875758f5942b3']],
                  '3.9.11' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '342344249a8f5cbfb205262aaf353a16']],
                  '3.9.12' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '5cb6e5fcb570702e99792352d0288a8a']],
                  '3.9.13' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'ae364ca23dae20cbdbfa5f861aa70e13']],
                  '3.9.14' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '38cbc7bd229691e2f7570f39e2ed79f0']],
                  '3.9.15' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', 'e61db9d4bdf4493d01f93b7f2d31b7aa']],
                  '3.9.16' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '8f4d451aeead063e6367c9d5dcd02ee7']],
                  '3.9.17' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '606d396504f13604794ec78b9d6bbd03']],
                  '3.9.18' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '00a16ead6ba35a470f68fe6a3aa56210']],
                  '3.9.19' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '43a22d7b481375d78386c9593fd1eb77']],
                  '3.9.20' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '50321fc2a768254650e69e0b4562473e']],
                  '3.9.21' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['readme.html', '50321fc2a768254650e69e0b4562473e']],
                  '3.9.22' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', 'f82e1f904e12a82ac15c63999427c909']],
                  '3.9.23' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '3.9.24' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '3.9.25' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '3.9.26' =>
                  [['wp-includes/css/editor.css', 'b5f9c498a1098ebdfbc2fa321f8bdf40'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.0' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', 'f00855fca05f89294d0fcee6bebea64a']],
                  '4.0.1' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '70cdb035f3dd51138d5997eaa4d93798']],
                  '4.0.2' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', 'ed8777afffc86285afc57984da43fdbd']],
                  '4.0.3' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '411d19aaa3bb5d45f8aa8714575ee48b']],
                  '4.0.4' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '85a6b662f1733509acb224c273897b24']],
                  '4.0.5' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '1adf30a1d6fe172f37da7dca83496c7d']],
                  '4.0.6' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '62a283e6ecb4bb247123392312469b40']],
                  '4.0.7' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '4ad554f864ffaf1ac491a610ba054e49']],
                  '4.0.8' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '009dd49817e70b9859b50d7d7e2b8152']],
                  '4.0.9' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '288f36185879e687f7cae3a7a41f8d6c']],
                  '4.0.10' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', 'ac4edd239f424cd811d0bb0097354405']],
                  '4.0.11' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '1b7fdd91e1cea1cb18779262e7b13dd0']],
                  '4.0.12' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '21a788d3e8b7945c20a47b975b3fc915']],
                  '4.0.13' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '01054cfb251b2bd00dc51f3a1c4beb5d']],
                  '4.0.14' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '84d35f2059bd5466c4f95cb632e710f3']],
                  '4.0.15' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', 'e53f13483b321b874cdb48b644a83ed1']],
                  '4.0.16' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '1d0ce532b0158c58560b8018f461d5d3']],
                  '4.0.17' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '8a91b1b0d5a535fe165bdf254ebdb40e']],
                  '4.0.18' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '17b05be902fc20a3d2428d41e01edf43']],
                  '4.0.19' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '4445478174fb84e1d0a1b2e14a7327c7']],
                  '4.0.20' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['readme.html', '4445478174fb84e1d0a1b2e14a7327c7']],
                  '4.0.21' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', '7325701f91d0eaa11ec0cc9a6087053f']],
                  '4.0.22' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '4.0.23' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.0.24' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.0.25' =>
                  [['wp-includes/css/editor.css', '1cbc0ca7cf2f6a0991a4da7cad7bd9c0'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.1' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '321aad4ba63043f888cb072cedf9ef78']],
                  '4.1.1' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'ce78b2213f70701834658c9007f0c947']],
                  '4.1.2' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '58c2fe4eb8b7866abb8912dc7fc2f616']],
                  '4.1.3' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '60ce7d3fed721c23cc46c7aaa77c1df8']],
                  '4.1.4' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '21584d9435d82fd371904611a7e25289']],
                  '4.1.5' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '30215f440132ce7414c4c48d1f520767']],
                  '4.1.6' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '0b91870a4cc0857bbcd9c140791ddede']],
                  '4.1.7' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'f91912f2fad5f1383927c9e98d3a7746']],
                  '4.1.8' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '97fa4d86c9b424b8810f872d1803d118']],
                  '4.1.9' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'db5c7b4f7bab8f481dbc78262bb92c2b']],
                  '4.1.10' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '04815654ef433ae5b019786e7c3753f1']],
                  '4.1.11' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'b0289dd7b86fb56f07708bb14f3795fc']],
                  '4.1.12' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '6c1415726fe2f04ad0157c6174d1f734']],
                  '4.1.13' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'fb4c2052b147355ba0b658d7860c37a5']],
                  '4.1.14' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '93d4cbf103b49ad6998f6a480519ced6']],
                  '4.1.15' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'f2ed0468d9ca40932e96ebe77e773762']],
                  '4.1.16' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '6767e3998a33bb43d004fab866af06c2']],
                  '4.1.17' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '405dedbfeec91210f7bab16575b56035']],
                  '4.1.18' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', '2822d4dc7ca874e3d1e76fd7c514efcc']],
                  '4.1.19' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'f66b292419a257a80d989a878fae8f8e']],
                  '4.1.20' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['readme.html', 'f66b292419a257a80d989a878fae8f8e']],
                  '4.1.21' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', 'e78dcab5e8dc6bfad93588602a065c8a']],
                  '4.1.22' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '4.1.23' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.1.24' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.1.25' =>
                  [['wp-includes/css/editor.css', 'a87f03a14efd9b8531164dac272aa07c'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.2' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', 'ded215e7acec9f6d04f3e370f486d3aa']],
                  '4.2.1' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', 'f18dcf7c554efc0b197d2a320e5cd248']],
                  '4.2.2' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '8592124f91d6da8273fc42b419f384b0']],
                  '4.2.3' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '3ed7c1a6e718ccce554978fdaab6526a']],
                  '4.2.4' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '31053c9e79e9e63bc76b8eb92f68ec75']],
                  '4.2.5' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '37e612ca4b342f682e0ad48b78de6cc9']],
                  '4.2.6' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '3296a741eaf6388b41f2b1e3d78783b8']],
                  '4.2.7' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '60598928e506e91491f9322e94cf52a6']],
                  '4.2.8' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '6adca796716ba77896b2a68c16ae99f2']],
                  '4.2.9' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '7346ab0a4d46d23cef6b6888a0727260']],
                  '4.2.10' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '162ee7badad63243dfe7c4679af1c019']],
                  '4.2.11' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', 'ddf7eb2aae278ab3a355aa248f9d8209']],
                  '4.2.12' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '6cdc477ceb7d6bba951928c2445823aa']],
                  '4.2.13' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '987eb46a501ec849f3f901e81b5b1871']],
                  '4.2.14' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '2fa1bad18fb6dde791717f130373dc56']],
                  '4.2.15' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', '622cdb329b1b5b5a6f5d76988df4272c']],
                  '4.2.16' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', 'b78ccf8b524dcd2f9706d919d036e61a']],
                  '4.2.17' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['readme.html', 'b78ccf8b524dcd2f9706d919d036e61a']],
                  '4.2.18' =>
                  [['wp-includes/js/mediaelement/flashmediaelement.swf', 'bed216acd6fb5318c139087a0a9d6b4d'],
                   ['readme.html', '5eda30f3d56256140bb60e3a74a62b95']],
                  '4.2.19' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '4.2.20' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.2.21' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.2.22' =>
                  [['wp-includes/css/editor.css', '4a459a304909052c6cdf05393599790b'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.3' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '0d302db33ba0e49aaac1698423ef4b54']],
                  '4.3.1' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '29c26e3150a452ccea556ee308935691']],
                  '4.3.2' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '80e2027d2ae1394172820adc117d51af']],
                  '4.3.3' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '324635de8b1d97e1e51d22b2dd79d472']],
                  '4.3.4' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '06c8085308f4e22411c477710338518c']],
                  '4.3.5' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', 'f957307acd12e95204a2c383272ce0fd']],
                  '4.3.6' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '3d896637a80f2816b92684ae9276cddd']],
                  '4.3.7' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '01d23a48d9f2397d36dffd8d3cd2a83a']],
                  '4.3.8' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '2a7f4dc8bd52d5d2e0cdea58d5949bff']],
                  '4.3.9' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '1ee25af3ea3fc41b19cc3ffe032bb7e2']],
                  '4.3.10' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', 'caceccdf6f23dcfa5aa582b307d9929c']],
                  '4.3.11' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '2489eed974e0d786eb3ca1798bf1c20a']],
                  '4.3.12' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '730ab685dd9a1742275818cdb3e44643']],
                  '4.3.13' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['readme.html', '730ab685dd9a1742275818cdb3e44643']],
                  '4.3.14' =>
                  [['wp-includes/js/mediaelement/flashmediaelement.swf', '079d5276459e0e3526afbdb7e1017037'],
                   ['readme.html', '5eda30f3d56256140bb60e3a74a62b95']],
                  '4.3.15' =>
                  [['readme.html', '5eda30f3d56256140bb60e3a74a62b95'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '4.3.16' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.3.17' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.3.18' =>
                  [['wp-includes/css/editor.css', '624d68ea15072444280b4f4e4f4522ec'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.4' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '30d62b21a621e81280b10e73945a5c38']],
                  '4.4.1' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '4aa090adebb81f9d0aeb38e1fd9ce2ec']],
                  '4.4.2' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', 'c17664e85bfe1b94a71597f49af06f77']],
                  '4.4.3' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', 'bb98b2cfe4e40d32280f8e79f18a3171']],
                  '4.4.4' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '02c45477bc7ab7d9ab792919f41833cc']],
                  '4.4.5' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', 'd7d38b02f37be897fca290cfacfba50a']],
                  '4.4.6' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '95cf7c3c42b0fba340e4ba9c7c637dfc']],
                  '4.4.7' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', 'c17af93c54f5e0f82f7d522b23254a01']],
                  '4.4.8' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', 'f13e86c96001ab7dc004e7e7364f3976']],
                  '4.4.9' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '5bfaba705cf6ed2704d911443f116049']],
                  '4.4.10' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '109d8930d992a36f805ac0a342c5b2e1']],
                  '4.4.11' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '41239be0065fa9d0afb246efcc9f782c']],
                  '4.4.12' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['readme.html', '41239be0065fa9d0afb246efcc9f782c']],
                  '4.4.13' =>
                  [['wp-includes/js/mediaelement/flashmediaelement.swf', 'e61c004611ce5cc855a3b2ab3e89602d'],
                   ['readme.html', '27ab6ce46fbbd0cf42bc22f13f2b2529']],
                  '4.4.14' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['license.txt', '2c55b47570a0802d3ec40781d2d6adc9']],
                  '4.4.15' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.4.16' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.4.17' =>
                  [['wp-includes/css/editor.css', 'aa25a3e29dd3a6af01e4fb6f80db10be'],
                   ['license.txt', 'f5847c886a3ea0cce59e06a502686989']],
                  '4.5' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '7abbf8d3edc718acefcbe963ecb4eb61']],
                  '4.5.1' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '5a06021dcac8af1d9790c5a3927d5235']],
                  '4.5.2' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '51ddc54e156a2eb1178dde690701afe3']],
                  '4.5.3' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '29c8aa59c025e67a8ac1d7a2270859ae']],
                  '4.5.4' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '03f530e9ec1ab1735e062d38149ff4ab']],
                  '4.5.5' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '34945973736fe4690ad8bfd98e6536e0']],
                  '4.5.6' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '49e8cd983673db23788eab8cfd68b6ce']],
                  '4.5.7' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '1a347a939012e6013e52dd80329db99d']],
                  '4.5.8' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '66a213aad3146927db0f82bc5d460622']],
                  '4.5.9' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', '3393eb4e7d645b2a0a31d3b6f5f7c9dd']],
                  '4.5.10' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', 'edc1c98719dffa3cddfac22dc100f605']],
                  '4.5.11' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['readme.html', 'edc1c98719dffa3cddfac22dc100f605']],
                  '4.5.12' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', 'e61c004611ce5cc855a3b2ab3e89602d']],
                  '4.5.13' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['license.txt', '0d0434c8b176c525a6fce9cefdf8e106']],
                  '4.5.14' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['license.txt', '9348da52c104f75fe1befc73609020cf']],
                  '4.5.15' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['license.txt', '9348da52c104f75fe1befc73609020cf']],
                  '4.5.16' =>
                  [['wp-includes/css/editor.css', '73eb43b774ec35091006e8d0d8b41eb1'],
                   ['license.txt', '9348da52c104f75fe1befc73609020cf']],
                  '4.6' =>
                  [['wp-includes/css/editor.css', '4016c604bcec8a6544c2c966cb8e6925'],
                   ['readme.html', '67ba56403014102858d999ee1667524f']],
                  '4.6.1' =>
                  [['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff'],
                   ['readme.html', 'df0f4d66b59b3338a5d012d52bc435fa']],
                  '4.6.2' =>
                  [['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff'],
                   ['readme.html', '43c6fcf7a5e24ed469e6ff13b03fe7a3']],
                  '4.6.3' =>
                  [['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff'],
                   ['readme.html', '997cfaa41d14c329574ab63128a6d8ef']],
                  '4.6.4' =>
                  [['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff'],
                   ['readme.html', '444385c242de092b106ddce230ed2626']],
                  '4.6.5' =>
                  [['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff'],
                   ['readme.html', '85889315124967dba655231bed63ca66']],
                  '4.6.6' =>
                  [['readme.html', '8e9f725564294e07c64765188bf9a3fe'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.7' =>
                  [['readme.html', '21b68e053d312980ee29e34e2d2a5946'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.8' =>
                  [['readme.html', '21b68e053d312980ee29e34e2d2a5946'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.9' =>
                  [['readme.html', '22ff6681a981a59d29c22339e164c4cb'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', '2efe1fabfea04432f090ecb3153b10a1']],
                  '4.6.10' =>
                  [['license.txt', '0d0434c8b176c525a6fce9cefdf8e106'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.11' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.12' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.6.13' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '2bb48c16cf49b06d70fea86fe99edfff']],
                  '4.7' =>
                  [['wp-includes/js/wp-api.js', '2933e0915238937a85a3a6730a6959da'],
                   ['wp-includes/css/editor.css', 'e97b439d9f0c638e88d8a4cc21823025']],
                  '4.7.1' =>
                  [['wp-includes/js/wp-api.js', '4cca1500e61bd40abe7b543fd76a5a06'],
                   ['wp-includes/js/media-views.js', '6fad095c6f295131844afbfb089956d3']],
                  '4.7.2' =>
                  [['wp-includes/js/wp-api.js', '4cca1500e61bd40abe7b543fd76a5a06'],
                   ['wp-includes/js/media-views.js', '6fad095c6f295131844afbfb089956d3']],
                  '4.7.3' =>
                  [['wp-includes/js/media-views.js', 'b44bc57736b0f9071a8d5b4e1a1c38c0'],
                   ['wp-includes/js/mce-view.js', '134875901c4aeec9dd4d791828e635a1']],
                  '4.7.4' =>
                  [['wp-includes/js/mce-view.js', 'e79d4033829ddc9cb1d968100df9b094'],
                   ['wp-includes/js/wp-api.js', '3b8c124f3009a102041cb7cc70474ed8']],
                  '4.7.5' =>
                  [['wp-includes/js/wp-api.js', 'fd75984f189d0a308e7f0fc70436e4eb'],
                   ['wp-includes/js/mce-view.js', 'e79d4033829ddc9cb1d968100df9b094']],
                  '4.7.6' =>
                  [['readme.html', 'fe8cf5b25298130f1b2ed912a5809e33'],
                   ['wp-includes/js/mce-view.js', '121281e52f8f9965f747ca5e8ab92abe']],
                  '4.7.7' =>
                  [['readme.html', 'fe8cf5b25298130f1b2ed912a5809e33'],
                   ['wp-includes/js/mce-view.js', '121281e52f8f9965f747ca5e8ab92abe']],
                  '4.7.8' =>
                  [['license.txt', '0d0434c8b176c525a6fce9cefdf8e106'],
                   ['readme.html', '092b5391da31c6e8bb02bf4bc03b6b34']],
                  '4.7.9' =>
                  [['license.txt', '0d0434c8b176c525a6fce9cefdf8e106'],
                   ['readme.html', '092b5391da31c6e8bb02bf4bc03b6b34']],
                  '4.7.10' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', 'e97b439d9f0c638e88d8a4cc21823025']],
                  '4.7.11' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', 'e97b439d9f0c638e88d8a4cc21823025']],
                  '4.7.12' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', 'e97b439d9f0c638e88d8a4cc21823025']],
                  '4.8' =>
                  [['wp-includes/js/media-views.js', '9bbd1fa91e81ac80c6e1cd12783681a5'],
                   ['wp-includes/css/editor.css', '177b13403b4c1d6ea0025572ac1b0b12']],
                  '4.8.1' =>
                  [['wp-includes/js/media-views.js', 'baa261d498278715c636677425927576'],
                   ['wp-includes/js/wp-emoji-loader.js', 'c2da74cc961f02f8a1532b9ef4c49f6f']],
                  '4.8.2' =>
                  [['wp-includes/js/wp-emoji-loader.js', '3c631f3faee929b38f97cf728a400838'],
                   ['wp-content/plugins/akismet/readme.txt', 'd0654db7613d0cd60264f96b10886dd7']],
                  '4.8.3' =>
                  [['wp-content/plugins/akismet/readme.txt', 'd1de027b31fe542758bd9259ffa527e9'],
                   ['wp-includes/css/editor.css', '177b13403b4c1d6ea0025572ac1b0b12']],
                  '4.8.4' =>
                  [['wp-content/plugins/akismet/readme.txt', '736b745dde9a656ee9284adf702c37cf'],
                   ['wp-includes/js/mediaelement/flashmediaelement.swf', '2efe1fabfea04432f090ecb3153b10a1']],
                  '4.8.5' =>
                  [['wp-content/plugins/akismet/readme.txt', '736b745dde9a656ee9284adf702c37cf'],
                   ['license.txt', '0d0434c8b176c525a6fce9cefdf8e106']],
                  '4.8.6' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '177b13403b4c1d6ea0025572ac1b0b12']],
                  '4.8.7' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '177b13403b4c1d6ea0025572ac1b0b12']],
                  '4.8.8' =>
                  [['license.txt', '9348da52c104f75fe1befc73609020cf'],
                   ['wp-includes/css/editor.css', '177b13403b4c1d6ea0025572ac1b0b12']],
                  '4.9' =>
                  [['wp-admin/js/theme.min.js', 'cb53c25524a16659fc1f961d507ba8bb'],
                   ['wp-includes/css/editor.css', '7234119d4cfae6ce5b9ad7689bde2b27']],
                  '4.9.1' =>
                  [['wp-admin/js/theme.min.js', '88f98b449b8aa12942cafd783b5aa7b5'],
                   ['wp-includes/js/mce-view.js', '1163b4783b075a846141a411ea2d5209']],
                  '4.9.2' =>
                  [['wp-includes/js/mce-view.js', 'f2e51a6cc3a8ea3f6d149602645bcb91'],
                   ['wp-includes/css/editor.css', '7234119d4cfae6ce5b9ad7689bde2b27']],
                  '4.9.3' =>
                  [['wp-includes/js/media-views.js', '608a9976d28d43953839ba010fe84e60'],
                   ['wp-includes/css/editor.css', '861f75019aa280e0b92aa0f9c9b84eaf']],
                  '4.9.4' =>
                  [['wp-includes/js/media-views.js', '608a9976d28d43953839ba010fe84e60'],
                   ['wp-includes/css/editor.css', '861f75019aa280e0b92aa0f9c9b84eaf']],
                  '4.9.5' =>
                  [['wp-includes/js/media-views.js', 'bd3abdf24209a6355e09603b811c866a'],
                   ['wp-includes/css/editor.css', '861f75019aa280e0b92aa0f9c9b84eaf']],
                  '4.9.6' =>
                  [['wp-includes/js/wp-emoji-loader.js', '2b204cc941a4670d627f549de9293d29'],
                   ['wp-includes/css/editor.css', '2ec44853d924b9eb24ff3cde0986aaaf']],
                  '4.9.7' =>
                  [['wp-includes/js/wp-emoji-loader.js', '2b204cc941a4670d627f549de9293d29'],
                   ['wp-includes/css/editor.css', '2ec44853d924b9eb24ff3cde0986aaaf']],
                  '4.9.8' =>
                  [['wp-includes/js/wp-emoji-loader.js', '67225f16229b76c9f2a0c46a15182781'],
                   ['wp-includes/css/editor.css', '2ec44853d924b9eb24ff3cde0986aaaf']],
                  '4.9.9' =>
                  [['wp-includes/js/wp-emoji-loader.js', '67225f16229b76c9f2a0c46a15182781'],
                   ['wp-includes/css/editor.css', '2ec44853d924b9eb24ff3cde0986aaaf']],
                  '5.0' =>
                  [['wp-includes/js/dist/edit-post.js', 'e8b57bb2a220a0add16fd29153bc2c62'],
                   ['wp-includes/css/editor.css', '049a4b5288c49f627f02b150bc28a8be']],
                  '5.0.1' =>
                  [['wp-includes/js/dist/edit-post.js', 'e8b57bb2a220a0add16fd29153bc2c62'],
                   ['wp-includes/css/editor.css', '049a4b5288c49f627f02b150bc28a8be']],
                  '5.0.2' =>
                  [['wp-includes/js/dist/edit-post.js', 'b8a4b45d991460d09f63361df8cece80'],
                   ['wp-includes/css/editor.css', '049a4b5288c49f627f02b150bc28a8be']]
  ]

  v = Version.new('WordPress', versions, @base_uri)

  version = v.matches_format

  # Set version if present
  unless version.empty?
    version.each do |ver|
      m << { name: 'md5 sums of files', version: ver }
    end
  end

  # Return aggressive matches
  m
end

end

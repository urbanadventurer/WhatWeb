##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Adobe-Experience-Manager"
authors [
  "Chad Brigance @ChadBrigance","wh1tenoise @wh1tenoise2"
]
version "0.1"
description "Adobe Experience Manager is an enterprise Content Management System (CMS) by Adobe."
website "https://www.adobe.com/marketing/experience-manager.html"

#examples %w| #https://www.adobe.com/ |

#def passive

# Dorks #

# Borrowing from AEM-dicovery.py
# https://github.com/0ang3el/aem-hacker/blob/master/LICENSE.txt
# def by_login_page(base_url, debug, proxy=None):
dorks [
  'inurl:/libs/granite/core/content/login.html "Welcome to Adobe Experience Manager"'
]

# Matches #
matches [
 
  # HTML

  # Borrowing from Wappalyzer (MIT License)
  # https://github.com/AliasIO/wappalyzer/blob/master/LICENSE
  # "html": [
  #      "<div class=\"[^\"]*parbase",
  #      "<div[^>]+data-component-path=\"[^\"+]jcr:",
  #      "<div class=\"[^\"]*aem-Grid"
  {:name=>"div class parbase", :regexp=>/<div class=\"[^\"]*parbase/},
  {:name=>"div data-component-path jcr", :regexp=>/<div[^>]+data-component-path=\"[^\"+]jcr:/},
  {:name=>"div class aem-Grid", :regexp=>/<div class=\"[^\"]*aem-Grid/},
  
  # Scripts 
  
  # Borrowing from Wappalyzer (MIT License)
  # https://github.com/AliasIO/wappalyzer/blob/master/LICENSE
  {:name=>"/etc/designs/", :regexp=>/<script type="text\/javascript" src="\/etc\/designs\//},
  {:name=>"/etc/clientlibs/", :regexp=>/<script type="text\/javascript" src="\/etc\/clientlibs\//},
  {:name=>"/etc.clientlibs/", :regexp=>/<script type="text\/javascript" src="\/etc\.clientlibs\//},

]

#end
# Aggressive #
# Not implemented yet... but aem-hacker has a great list of checks.


end

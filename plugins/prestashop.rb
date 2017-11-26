##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
############################
# WhatWeb plugin by NetAgence.com
############################
##
# Version 0.2 # # 2016-08-19 # Bhavin Senjaliya <bhavin.senjaliya@gmail.com>
# Reduced version from 1.0 to 0.2.
# Added Bhavin's cookie
##
Plugin.define do
name "PrestaShop"
author "Chris, NetAgence.com"
version "0.2"
description "Ecommerce CMS Prestashop."
website "http://www.prestashop.com/"

# Google results as at 2011-07-19 #
# 989 for inurl:id_cms

# Dorks #
dorks [
'inurl:id_cms'
]

# identifying strings
# <meta name="description" content="Boutique propuls&eacute;e par PrestaShop" />
# <meta name="generator" content="PrestaShop" />
# <meta name="description" content="Shop powered by PrestaShop" />

# Matches #
matches [

  {:name=>"PrestaShop-powered meta generator",
  :regexp=>/<meta name="generator"[^>]*content="PrestaShop/},

  {:string=>"FR",
  :name=>"PrestaShop-Powered meta description",
  :regexp=>/<meta name="description"[^>]*content="par PrestaShop/},

  {:string=>"EN",
  :name=>"PrestaShop-Powered meta description",
  :regexp=>/<meta name="description"[^>]*content="Shop powered by PrestaShop/},

  {:name=>"html comment",
  :regexp=>/<!-- \/Block permanent links module HEADER -->/},

  # Cookie 
  { :search => "headers[set-cookie]", :regexp => /PrestaShop/, :name=>"PrestaShop cookie" },

#{:text=>"<meta name=\"description\" content=\"Boutique propuls&eacute;e par PrestaShop\" />", :name=>"PrestaShop-Powered meta description (FR)"},
#{:text=>"<meta name=\"description\" content=\"Shop powered by PrestaShop\" />", :name=>"PrestaShop-Powered meta description (EN)"},
#{:text=>"<meta name=\"generator\" content=\"PrestaShop\" />", :name=>"PrestaShop-Powered meta generator"}
#{ :text=>'<!-- /Block permanent links module HEADER -->' }

]

end


Plugin.define do
name "BigCommerce"
author "Claudio Salazar <csalazar at spect dot cl>"
version "0.1"
description "Fully loaded with killer features. -
  Homepage: http://www.bigcommerce.com/"

matches [
{
  :name=>"iselector.css is a common file in BigCommerce systems",
  :regexp=>/\/iselector.css/
},
#Common variables
{ :regexp=>/config.ShopPath = /},
{ :regexp=>/config.AppPath = /}
]

end
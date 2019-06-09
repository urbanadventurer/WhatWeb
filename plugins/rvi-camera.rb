##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "RVI-Camera"
authors [
  "Andrew Horton",
]
version "0.1"

description "RVI Camera Monitoring System. H.264 IP Web Camera"

matches [
{:text=>'Скачать файл установки OCX&nbsp;&nbsp;&nbsp;<a href="xdview.exe">', :url=>'/login.asp' },
{:text=>'<Meta name="Author" Content="hhdigital">'}

]

end


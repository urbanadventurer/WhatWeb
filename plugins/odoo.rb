Plugin.define 'Odoo' do
  author 'Naglis Jonaitis'
  version '0.1'
  description 'Odoo is an all-in-one management software that offers a range of business applications that form a complete suite of enterprise management applications targeting companies of all sizes.'
  website 'Homepage: https://www.odoo.com/'

  matches [
    { :name => 'generator', :text=>'<meta name="generator" content="Odoo"/>' },
    { :name => 'favicon', :url => '/web/static/src/img/favicon.ico', :md5 => 'a342fe863a8e41dff2a55410c7f118c5'},
  ]
end

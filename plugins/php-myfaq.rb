Plugin.define 'phpmyfaq' do
  author 'Dhiraj Mishra'
  version '0.1'
  description 'phpMyFAQ is a mobile-friendly, feature-rich, scalable open source FAQ software using PHP 5.6+ and PHP 7+'
  website 'Homepage: https://www.phpmyfaq.de/'

  matches [
    { :name => 'description', :text=>'<meta property="og:description" content="phpMyFAQ should be the answer for all questions in life">' },
    { :name => 'favicon', :url => '/favicon.ico', :md5 => '5cc634424775c216d06120e5975eb9e5'},
  ]
end

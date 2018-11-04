Plugin.define 'phpscriptsmall' do
  author 'Dhiraj Mishra'
  version '0.1'
  description 'Php Scripts Mall is the professional website clone developing company with more than 400 plus readymade php script. An ultimate solution for the startup entrepreneurs who can start their business through our wide range of clone script. Highly responsive design and clear coding style with user friendly structure.'
  website 'Homepage: https://www.phpscriptsmall.com/'

  matches [
    { :name => 'generator', :text=>'<meta name="robots" content="noodp"/>' },
    { :name => 'favicon', :url => '/wp-content/uploads/2017/11/fav-icon.png', :md5 => '1a080bffdbaf2ba1142ac73fa1dce9ad'},
  ]
end

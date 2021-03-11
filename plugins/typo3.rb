##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TYPO3"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-04-09
  "Andrew Horton", # v0.2 # 2012-08-16 # Updated MD5 syntax. In future someone should move the MD5 hash matches into the matches array. 
  "Bhavin Senjaliya <bhavin.senjaliya@gmail.com>", # v0.3 # 2016-08-19 # Added cookie
  "Janosch Maier @Phylu", # v0.4 # 2018-04-20 # bugfix in regex 
  "Chad Brigance @definity", # v0.5 # 2021-03-10 # added more passive detection and hashes for versions 9-11
]
version "0.5"
description "TYPO3 is a free Open Source content management system for enterprise purposes on the web and in intranets. It offers full flexibility and extendability while featuring an accomplished set of ready-made interfaces, functions and modules."
website "http://typo3.com/"

# More examples here: http://welovet3.com/

# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="TYPO3 ([\d\.]+) CMS"/ },

# HTML Comment
{ :text=>'<!--TYPO3SEARCH_end-->', :certainty=>75 },
{ :name=>"Powered by HTML comment", :regexp=>/<!--\W+This website is powered by TYPO3/ },

# Header Checks
{ :search => "headers[set-cookie]", :regexp => /^fe_typo_user/, :name=>"fe_typo_user cookie" },
{ :search => "headers[x-typo3-parsetime]", :regexp => /\d+ms/, :name=>"X-TYPO3-Parsetime header" },

]

# Aggressive #
aggressive do
	m=[]

	# the paths are relative to the url path if they don't start with /
	# this path, with this md5 = this version
	files=[

	{ :md5=>'fa6bed20b07e72ae7140daf35bf9d194', :version=>'3.3.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'f8cf9f0ee879a5ed1f4cdbda5f66fe42', :version=>'3.5.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'91679c5cebe4dd2d3c6ef41a01252f56', :version=>'3.6.x - 3.8.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'65cdbcbfda7bd1512d61033f22919c04', :version=>'4.0.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'8268823e266152decfb7bb1ba652ab32', :version=>'4.1.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'21ba8e02551157b345885d9aec091ca2', :version=>'4.2.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'efda8e345a6516ea97a8412875e3b100', :version=>'4.3.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'4a464632a5a0865009bdf3d48bacbba9', :version=>'4.4.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'12a91f85007c0deb3f1c798faef7a336', :version=>'4.5.x', :path=>'t3lib/jsfunc.evalfield.js' },
	{ :md5=>'7d6f7ccbc4257ca8e0d952e4586a5577', :version=>'6.1.x', :path=>'typo3/js/tree.js' },
	{ :md5=>'36741bfbbf60c3ae3370d1fcacafd562', :version=>'6.2.x', :path=>'typo3/js/tree.js' },
	{ :md5=>'3287390bce962a070d01f0fbc77e8d98', :version=>'7.0.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'688715e7f2b3e34de595083926b1c5d6', :version=>'7.1.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'8802bd97763db8c94a46dea8424f8a2f', :version=>'7.2.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'033d2c5965493bd599526a2ec6c6b1c2', :version=>'7.3.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'e46e25a14c4429e88439ee2ce2cfa8b1', :version=>'7.4.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'5a581b85d07fd4ab2e9b319a177e09ae', :version=>'7.5.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'5a581b85d07fd4ab2e9b319a177e09ae', :version=>'7.6.0/7.6.1/7.6.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'1a59c65788fb35d2ae5ef28aa7ed887a', :version=>'7.6.3/7.6.4', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'51e791e3ac7014583c7d516534991387', :version=>'7.6.5/7.6.6/7.6.7', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/DragUploader.js' },
	{ :md5=>'9dbefa9ee5f9ce30f1872e70e27a9604', :version=>'7.6.8/7.6.9', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngine.js' },
	{ :md5=>'ab33f4ab2ee1bdc206736de9ab1e9eeb', :version=>'7.6.10', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngineSuggest.js' },
	{ :md5=>'a6fc92a1274764f2f08d1029f76a730c', :version=>'7.6.11', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngineSuggest.js' },
	{ :md5=>'36fe0df4954b1e3fea9c5a0dc98d9ad6', :version=>'8.0.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngine.js' },
	{ :md5=>'4c88b3ea158328242cd6b3f37d40c4e5', :version=>'8.0.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngine.js' },
	{ :md5=>'67a2d028d995e1f393450fcf628a6cd4', :version=>'8.1.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngine.js' },
	{ :md5=>'142c4e3a8830066cb4cd5843482908d9', :version=>'8.2.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/FormEngine.js' },
	{ :md5=>'f1bbf914a52ad4a1c046c172b75efb5a', :version=>'8.2.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
	{ :md5=>'821c0f0e29eb9b95f09cbcc25bc47d38', :version=>'8.3.x', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
	{ :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'8.4.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f62238c71f8bd7649cb9851dfe6fd437', :version=>'7.1.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'01162767f0fa3de6ee08cd4037a4f0b5', :version=>'7.2.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'ab3f371c174ebd7e71354d779386ad6a', :version=>'7.3.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'ab3f371c174ebd7e71354d779386ad6a', :version=>'7.3.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'cacc859cc81204d9eb8f9c05b843bbcf', :version=>'7.4.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'2f814f8897b8561a8b9c1104bc80bd4e', :version=>'7.5.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4e1784ccd188f04d4ec4894d41062f30', :version=>'7.6.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f1bbf914a52ad4a1c046c172b75efb5a', :version=>'7.6.10', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3c39d7e12d51e8d07c6cc3cc3ee5646c', :version=>'7.6.11', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.12', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.13', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.14', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.15', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.16', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.17', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.18', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.19', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8c9c2caaa2a8b194d76bb750e3d0e9f3', :version=>'7.6.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.20', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.21', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.22', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.23', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.24', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.25', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.26', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.27', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.28', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.29', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8c9c2caaa2a8b194d76bb750e3d0e9f3', :version=>'7.6.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.30', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.31', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'7.6.32', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.3', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.4', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.5', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.6', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.7', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.8', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'7.6.9', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'8.0.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'8.0.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'8.1.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'8.1.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3d6d9ed3f550027572ca751dbe54afa0', :version=>'8.1.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'9d1065a66f8fd250e67924c76b1c76dd', :version=>'8.2.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f1bbf914a52ad4a1c046c172b75efb5a', :version=>'8.2.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'821c0f0e29eb9b95f09cbcc25bc47d38', :version=>'8.3.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'821c0f0e29eb9b95f09cbcc25bc47d38', :version=>'8.3.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'8.4.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'8.4.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'8.5.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'d18a74b735139ee0eed133fc0867f9b8', :version=>'8.5.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'96cb1a27e009337035979f7aede0c81d', :version=>'8.6.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'96cb1a27e009337035979f7aede0c81d', :version=>'8.6.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'15459ef332a4471aee467350d9b63559', :version=>'8.7.10', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.11', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.12', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.13', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.14', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.15', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.16', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.17', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.18', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.19', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.20', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.21', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.22', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.23', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.24', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.25', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.26', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.27', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.28', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.29', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.30', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.31', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'3eaa87fe2fe2b6283b1776f3106df21d', :version=>'8.7.32', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.3', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.4', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.5', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.6', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.7', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.8', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'a60e9dfb3b16f822c85713f237e26a2a', :version=>'8.7.9', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.9', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.8', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.7', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.6', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.5', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.4', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.3', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'320db84396f6064c1d956ce156bc4ab9', :version=>'9.5.24', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'320db84396f6064c1d956ce156bc4ab9', :version=>'9.5.23', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'320db84396f6064c1d956ce156bc4ab9', :version=>'9.5.22', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.21', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.20', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'824856287663006a8763f23f37cdd71d', :version=>'9.5.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.19', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.18', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.17', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.16', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'8d6eb428cdb6a55304eb500ea1975e7c', :version=>'9.5.15', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.14', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.13', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.12', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.11', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'9.5.10', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'824856287663006a8763f23f37cdd71d', :version=>'9.5.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'824856287663006a8763f23f37cdd71d', :version=>'9.4.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'55e5fff88c3ebbe337aa33fa625587be', :version=>'9.3.3', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'55e5fff88c3ebbe337aa33fa625587be', :version=>'9.3.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'55e5fff88c3ebbe337aa33fa625587be', :version=>'9.3.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'55e5fff88c3ebbe337aa33fa625587be', :version=>'9.2.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'55e5fff88c3ebbe337aa33fa625587be', :version=>'9.2.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'0ca8f96427f15e28c9ca9745af2a4fbc', :version=>'9.1.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'0ca8f96427f15e28c9ca9745af2a4fbc', :version=>'9.0.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'0a700774298d21a5b0576c4aa167b5d8', :version=>'11.1.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a27b95d8b2164d95895e3e0a6645f3e', :version=>'11.0.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.9', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.8', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.7', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.6', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.5', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.4', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.3', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.13', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.12', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.11', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'30f67b42c4227f11ba6ee9edb1b6d064', :version=>'10.4.10', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'c9db32c200357d4be414ad960e8e5ebd', :version=>'10.4.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'566de2cba869600d9f2fb13bc90a6d2c', :version=>'10.3.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f79fa136b20ca1fa3e9e9e5db260c1dd', :version=>'10.2.2', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f79fa136b20ca1fa3e9e9e5db260c1dd', :version=>'10.2.1', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f79fa136b20ca1fa3e9e9e5db260c1dd', :version=>'10.2.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'f79fa136b20ca1fa3e9e9e5db260c1dd', :version=>'10.1.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },
        { :md5=>'4a54f6e48d9f53f158e8ffb39da7a6b5', :version=>'10.0.0', :path=>'typo3/sysext/backend/Resources/Public/JavaScript/LoginRefresh.js' },


	]

	# Fetch and hash files
	to_download = files.map {|x| x[:path]}.sort.uniq
	downloads={}
	to_download.each do |d|
		target = URI.join(@base_uri.to_s,d).to_s	
		status,url,ip,body,headers=open_target(target)
		downloads[d] = {:md5sum=>Digest::MD5.hexdigest(body).to_s}	
	end

	# Compare file hashes to known hashes
	version=nil
	files.each do |thisfile|
		unless downloads[thisfile[:path]].nil?
			version=thisfile[:version] if downloads[thisfile[:path]][:md5sum] == thisfile[:md5]
		end
	end

	# Set version if present
	unless version.nil?
		m << {:name=>"md5 sums of files", :version=>version}
	end

	# Return aggressive matches
	m
end

end



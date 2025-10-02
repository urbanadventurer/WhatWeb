Version 0.6.2 - August 25, 2025

Changelog:
* Fixed uninitialized constant error. Requires 'set' gem for specific Ruby versions. (@J-Run)
* Added support for scanning .onion (Tor) domains when using HTTP proxy
  - Bypasses DNS resolution for .onion domains to enable scanning through Tor proxy
  - Allows scanning of Tor hidden services without DNS resolution errors
  - Compatible with custom/internal TLDs


Version 0.6.1 - August 2, 2025

Changelog:
* Updated version from 0.5.5 to 0.6.1
* Improved SSL/TLS security with comprehensive cipher suite support (TLSv1, TLSv1.1, TLSv1.2, SSLv3, SSLv2)
  - Added SSL_ATTRIBUTES constant for verify_mode
  - Replaced dynamic SSL parameter collection with explicit SSLContext configuration
  - Set verify_mode to VERIFY_NONE for maximum compatibility
  - Enabled negotiation of all SSL/TLS versions including legacy SSLv2/SSLv3
* Enhanced HTTPS connection handling with optimized verification settings
  - Cleared minimum version restrictions and disabled protocol exclusion flags
  - Added fallback handling for different OpenSSL configurations
* Added dual-protocol feature: simple hostnames (without paths or ports) are now scanned using both HTTP and HTTPS protocols
  - Automatically creates and tests both HTTP and HTTPS versions of simple hostnames
  - Shows informational message when dual-protocol scanning is performed
  - Intelligently detects and avoids duplicate URL scanning with redirect handling
* Added robust input validation and error handling
  - Automatically aborts processing after 10 consecutive parsing errors
  - Prevents wasted resources when processing invalid data sources
  - Provides helpful error messages to guide users in troubleshooting input issues
  - Handles various error cases including malformed URLs and non-URL input data
* Improved dependency management with Bundler group support
  - Reorganized Gemfile with proper optional group definitions for mongo and rchardet
  - Added clear installation instructions for optional dependencies
  - Set explicit version constraints for test dependencies
  - Added support for older Bundler versions through GEMFILE_GROUPS environment variable
* Expanded documentation for optional dependencies
  - Added detailed installation instructions for MongoDB support
  - Added clear steps for character set detection configuration
  - Provided combined installation commands for all optional features
  - Improved explanation of performance implications

This release introduces three new search contexts for plugin authors to use:
- uri.path
- uri.query
- uri.extension

An example of how to use this is from the PHP plugin.

```
# File Extension
{ :name=>"File extension", :regexp=>/^(php|phtml|php3|php4|php5|phps)$/, :search=>"uri.extension" }
```

## FIXES
* #311 - JSON Logging fails... UTF-8 can't modify frozen String (@juananpe)

## MISC
* Refactored Helper::convert_to_utf8. Droped Ruby 2.0 support (@urbanadventurer)
* Added new search contexts for plugins: uri.path, uri.query, uri.extension (@urbanadventurer)

## NEW PLUGINS
* Plex Media Server (@urbanadventurer)
* Meta-Facebook-Infrastructure (@urbanadventurer)
* Netflix-Platform (@urbanadventurer)
* VKontakte-Platform (@urbanadventurer)
* Distributed-Tracing (@urbanadventurer)
* Modern-Security-Headers (@urbanadventurer)
* Baidu-Platform (@urbanadventurer)
* Alibaba-Aliyun (@urbanadventurer)
* Weibo-Platform (@urbanadventurer)

## PLUGIN UPDATES
* Adobe-Flash (@urbanadventurer)
* ASP_NET (@urbanadventurer)
* ColdFusion (@urbanadventurer)
* Drupal (@gboddin)
* Java (@urbanadventurer)
* Perl (@urbanadventurer)
* PHP (@urbanadventurer)
* Python (@urbanadventurer)
* Ruby (@urbanadventurer)
* TYPO3 (@definity)
* WordPress (@juananpe)
* Shopify (enhanced HTTP header detection) (@urbanadventurer)
* CloudFlare (enhanced with CF-RAY and other headers) (@urbanadventurer)
* CloudFront (renamed to Amazon-CloudFront and enhanced) (@urbanadventurer)
* Tengine Web Server (added Alibaba-specific headers) (@urbanadventurer)
* Content-Security-Policy (added modern CSP headers) (@urbanadventurer)
* Azure (renamed to Microsoft-Azure and enhanced) (@urbanadventurer)



Version 0.5.5 - January 16, 2021

## FIXES
* #358 Fixed escape_for_sql method (@juananpe)

## NEW PLUGINS
* Apache Flink (@juananpe)
* Dell-OpenManage-Switch-Administrator (@themaxdavitt)
* FLIR AX8 (@urbanadventurer)
* Huginn (@urbanadventurer)
* OpenResty (@urbanadventurer)
* Telerik UI (@definity)
* Umbraco (@definity / @ChadBrigance
* VMware Horizon (@themaxdavitt)

## PLUGIN UPDATES
* Joomla (@juananpe)
* phpMyAdmin (@juananpe)
* Microsoft IIS (@themaxdavitt)


Version 0.5.4 - December 14, 2020

## FIXES
* #345 Fixed colour output problem with white text being invisible when users have a white terminal background (@urbanadventurer)
* #347 Fixed MongoDB compatibility logging issue (@juananpe)

## NEW PLUGINS
* BlockScout (@urbanadventurer)
* ElasticSearch (@urbanadventurer)
* Grafana (@urbanadventurer)

## PLUGIN UPDATES
* Kibana (@urbanadventurer)


Version 0.5.3 - October 1, 2020

This is a minor release with miscellaneous changes, seven new plugins, and two plugin updates.

## MISC
* #319 MongoDB logging now uses upsert (update by default, insert if new) (@juananpe)
* #314 Makefile now allows supports the PREFIX environment variable (@bfontaine)

## NEW PLUGINS
* Adobe Experience Manager (AEM) (@definity)
* JFrog Artifactory (@bcoles)
* Matomo (@urbanadventurer)
* MobileIron-MDM (@bcoles)
* Slack-Workspace (@bcoles)
* Wobserver (@urbanadventurer)
* Zoom (@bcoles)

## PLUGIN UPDATES
* Magento (@huntertl)
* phpMyAdmin (@juananpe)

## FEATURES
* #303 Added ability to select network interface. Thanks @audibleblink.

Version 0.5.2 - June 9, 2020

This is a minor update with bug fixes, and one new plugin, PHP-Slim.

## FIXES
* #299 Fixed `warning: URI.escape is obsolete` error by using the Using Addressable Gem. Thanks @weidsom (Weidsom Nascimento)
* #306, #307 Improvements to Makefile. @xambroz
* #304 Log level for mongodb-logger is set to "FATAL", unless WhatWeb is run with debug-mode enabled. @helsecert

## NEW PLUGINS

* PHP-Slim Marcelo Gimenes (@cgimenes)

Version 0.5.1 - February 25, 2020

This is a minor release with bug fixes, one new plugin, and a couple of plugin updates.

## FIXES
* #275 Makefile now installs on macOS
* #286 typo for --cookie-jar commandline option.
* #283 path loading issue when whatweb is installed as a symlink. @abenson and @blshkv
* #288 error with JSON output when the target list is empty
* #289 removed empty object from end of JSON output
* #293 and #294 Fix MongoDB output @LrsK

## MISC
* Makefile now installs a symlink in the PATH
* CHANGELOG.md and INSTALL.md files are now in MarkDown format
* Removed requirement for open3 gem in Integration Tests

### NEW PLUGINS
* Bootstrap - @phylu

## PLUGIN UPDATES
* Kayako-SupportSuite - @urbanadventurer
* ASP_NET - @urbanadventurer


Version 0.5.0 - October 4, 2019

Version 0.5.0 is a major version release form @urbanadventurer and @bcoles. 👏 With the help of the WhatWeb community we have reached over 1800 plugins!  

⚠️ Plugin authors should take note that this release is not backwards compatible, and we have made a migration tool to help you update your private or unreleased plugins.

## FEATURES
* Added WhatWeb Logo and icons
* Added IDN (International Domain Name) support
* Merged 31 new plugins by Bhavin Senjaliya and 22 plugin updates from the unofficial WhatWeb gem at https://rubygems.org/gems/whatweb/
* Added 9 unit tests
* Added loading cookies from a FILE with --cookie-jar=FILE in the document.cookie format
* Added Migration tool to convert plugins to the v0.5 format in plugin-development/migrate-plugins-to-v0.5.rb
* Refactored and modularised the codebase -- @urbanadventurer and @bcoles 

## FIXES
* Bug fix - Ruby 2.4 and 2.5 OpenSSL issue
* Bug fix - Fixed ElasticSearch version 6+ issue
* Bug fix - SQL output issue
* Bug fix - In HTTP Auth parsing @rmaksimov 
* Fix bug causing WhatWeb to exit with no output. Thanks @mguillau42 for tracking down this race condition.
* Typo fix. Thanks Jose Nazario (@paralax)
* Bug fix - clean incorrent UTF-8 byte sequences when loading from file @dirtyfilthy

## MISC
* Updated all plugins with an authors array to show multiple authors
* Plugin list now shows plugin names and websites instead of a truncated plugin description.
* Updated the usage help. Reduced the size of the short usage help.
* Better error reporting in commandline options
* Updated README and converted to Markdown format
* Updated manpage
* Plugins instance variable handling improvement. @Code0x58
* Plugin name defined within plugin as variable. @Code0x58
* Changed from functions to blocks for passive and aggressive plugins. @Code0x58
* Changed plugin locking  @Code0x58
* Changed the behaviour of --grep to only output results that match the grep plugin
* Changed the behaviour of --grep so regexp or text can be matched
* Removed feature --follow-redirect same-domain because it relies on the out-dated TLD library for valid TLDs and SLDs
* Removed requirement for 'nmap' and now use the IPAddr gem for IP address ranges. CIDR, x.x.x.x-x.x.x.x and x.x.x.x-x supported

##  PLUGINS
* 48 new plugins from contributors
* 31 plugins updated from contributors
* 100+ plugin updates by Andrew Horton (@urbanadventurer)

### NEW PLUGINS
* 1n1-hosting.rb - Bhavin Senjaliya (@bhavin1223)
* amazon-elastic-load-balancer.rb - Bhavin Senjaliya (@bhavin1223)
* azure.rb - Bhavin Senjaliya (@bhavin1223)
* bad-behaviour-anti-spam-plugin.rb - Bhavin Senjaliya (@bhavin1223)
* clickmotive.rb - Bhavin Senjaliya (@bhavin1223)
* cdk-connected-website.rb - Bhavin Senjaliya (@bhavin1223)
* craftcms.rb - Bhavin Senjaliya (@bhavin1223)
* f5-big-ip.rb - Bhavin Senjaliya (@bhavin1223)
* hubspot.rb - Bhavin Senjaliya (@bhavin1223)
* jw-player.rb - Bhavin Senjaliya (@bhavin1223)
* laravel.rb - Bhavin Senjaliya (@bhavin1223)
* mezzanine.rb - Bhavin Senjaliya (@bhavin1223)
* moonfruit.rb - Bhavin Senjaliya (@bhavin1223)
* netsuite.rb - Bhavin Senjaliya (@bhavin1223)
* nop-commerce.rb - Bhavin Senjaliya (@bhavin1223)
* pyro-cms.rb - Bhavin Senjaliya (@bhavin1223)
* sailsjs.rb - Bhavin Senjaliya (@bhavin1223)
* schoolwires-centricity.rb - Bhavin Senjaliya (@bhavin1223)
* shopify.rb - Bhavin Senjaliya (@bhavin1223)
* sitecore.rb - Bhavin Senjaliya (@bhavin1223)
* square-space.rb - Bhavin Senjaliya (@bhavin1223)
* tealeaf.rb - Bhavin Senjaliya (@bhavin1223)
* teleflora.rb - Bhavin Senjaliya (@bhavin1223)
* unbounce.rb - Bhavin Senjaliya (@bhavin1223)
* website-tonight.rb - Bhavin Senjaliya (@bhavin1223)
* webtrends.rb - Bhavin Senjaliya (@bhavin1223)
* weebly.rb - Bhavin Senjaliya (@bhavin1223)
* wix.rb - Bhavin Senjaliya (@bhavin1223)
* wordfence.rb - Bhavin Senjaliya (@bhavin1223)
* world-now.rb - Bhavin Senjaliya (@bhavin1223)
* wpml.rb - Bhavin Senjaliya (@bhavin1223)
* bigcommerce.rb - Claudio Salazar (@csalazar)
* demandware.rb - Claudio Salazar (@csalazar)
 *ocp.rb - Claudio Salazar (@csalazar)
* aspforum.rb - Mateusz Golewski (@golewski)
* lithium.rb - Mateusz Golewski (@golewski)
* stackexchange.rb - Mateusz Golewski (@golewski)
* xenforo.rb - Mateusz Golewski (@golewski)
* kinja.rb - Sigit Dewanto
* trbas.rb - Sigit Dewanto
* advance_digitalmg.rb - Elias Dorneles (@eliasdorneles)
* newbay_media.rb - Elias Dorneles (@eliasdorneles)
* gannett.rb - Eugene Amirov (@Allactaga)
* yaf.rb - Eugene Amirov (@Allactaga)
* blox.rb - Shuai Lin (@lins05)
* mcclatchy_interactive.rb - Shuai Lin (@lins05)
* tribune.rb - Shuai Lin (@lins05)
* genexus.rb - Daniel Maldonado (@elcodigok)
* odoo.rb - Naglis Jonaitis (@naglis)

###  PLUGIN UPDATES
* 3dcart.rb - Bhavin Senjaliya (@bhavin1223)
* asp-net.rb - Bhavin Senjaliya (@bhavin1223)
* big-commerce.rb  - Bhavin Senjaliya (@bhavin1223)
* blox.rb - Bhavin Senjaliya (@bhavin1223)
* demandware.rb - Bhavin Senjaliya (@bhavin1223)
* django.rb  - Bhavin Senjaliya (@bhavin1223)
* dot-cms.rb - Bhavin Senjaliya (@bhavin1223)
* DotNetNuke.rb - Bhavin Senjaliya (@bhavin1223)
* drupal.rb - Bhavin Senjaliya (@bhavin1223)
* ektron.rb - Bhavin Senjaliya (@bhavin1223)
* expression-engine.rb  - Bhavin Senjaliya (@bhavin1223)
* incapsula.rb - Bhavin Senjaliya (@bhavin1223)
* kentico.rb - Bhavin Senjaliya (@bhavin1223)
* magento.rb  - Bhavin Senjaliya (@bhavin1223)
* nitix-netscaler.rb - Bhavin Senjaliya (@bhavin1223)
* piwik.rb  - Bhavin Senjaliya (@bhavin1223)
* prestashop.rb  - Bhavin Senjaliya (@bhavin1223)
* ruby-on-rails.rb  - Bhavin Senjaliya (@bhavin1223)
* symfony.rb  - Bhavin Senjaliya (@bhavin1223)
*  blox.rb - Bhavin Senjaliya (@bhavin1223)
* typo3.rb  - Bhavin Senjaliya (@bhavin1223)
* vbulletin.rb - Bhavin Senjaliya (@bhavin1223)
* xenforo.rb - Bhavin Senjaliya (@bhavin1223)
* smf.rb - Claudio Salazar (@csalazar)
* vbulletin.rb - Claudio Salazar (@csalazar)
* bbpress.rb - Shuai Lin (@lins05)
* joomla.rb (aggressive version detection) - @anozoozian
* jquery.rb - Janosch Maier (@Phylu)Janosch Maier (@Phylu)
* typo3.rb - Janosch Maier (@Phylu)
* wordpress.rb - @ajgon (Igor Rzegocki) - aggressive matches up to 5.0.2.
* wordpress.rb - @SlivTaMere
* wordpress.rb - @anozoozian


Version 0.4.9 November 23rd 2017
* Added unit testing with rake @bcoles
* Added Elastic Search output @SlivTaMere
* Source code formatting cleanup @Code0x58
* Thread reuse and logging through a single thread @Code0x58
* Fixed max-redirection bug @Code0x58
* Fixed bug when using a proxy and HTTPS (unknown user)
* Fixed timeout deprecation warning @iGeek098
* New plugins and plugin updates @guikcd @bcoles @andreas-becker
* Added proxy and user-agent to logging @rdubourguais
* Updated Alexa top websites lists
* Updated update-alexa script
* Updated IP to Country database
* Updated man page
* Updated Mongo DB output for Mongo 2.x

Version 0.4.8-dev (Continuous release 2012 - 2017)

* Added support for all ciphers - TLSv1:TLSv1.1:TLSv1.2:SSLv3:SSLv2.  Thanks @milo2012
* New colour scheme for brief output
* New Verbose output
* --color, --colour now takes case insensitive arguments, and can be enabled under Windows
* HTTP Status descriptions are now included in brief and verbose output
* Added short usage help
* Converted all plugins to lowercase filenames
* Updated plugins. Moved 100s of patterns in passive functions to matches[]
* Added --search-plugins
* Fixed bug with relative :url matching
* Fixed bug with JSON output parsing
* Fixed bug where :search => headers[xyz] was not case insensitive
* Fixed bugs for Ruby 1.9.x and Ruby 2.x. Dropped support for Ruby 1.8.x. Thanks to nil0x42 and pvdl for bug fixes
* Added TLSv1 support for Ruby 1.9.x and Ruby 2.x
* Updated plugin list output
* Updated plugin info output
* Renamed scripts in plugin-development/ that update the Alexa lists and IP Country Database
* Updated get-pattern for Ruby 2.x
* Added over 700 new plugins
* Added aggressive version detection using md5 static file matches to several plugins
* Added support for raw HTTP headers when scanning local files
* Added --dorks <plugin name> to return google dorks for the selected plugin
* Added google dorks to more than 500 plugins
* Added ./addons/hunter
* Added ./addons/gggooglescan
* Added ./addons/country-scanner
* Added SQL logging with `--log-sql` and `--log-sql-create` arguments.
* Added raw header support by monkey patching the net/http library
* Added context searching for plugin matches[]. Added the matches keyword, :search. Values can be "headers","headers[server]"(or any other HTTP header),"body"(default), "all" (the raw headers + body)
* Added methods for aggressive plugins to send HEAD and POST requests
* Added --grep, -g option. Similar usage to --custom-plugin. (Requested by Scott Bell)
* Removed the spidering feature and dependence on the customised and unsupported Anemone gem
* Removed the extra_urls feature
* Removed dependency on em-resolv-replace
* Updated whatweb.xsl
* Fixed a bug causing Mongo DB logging to fail
* Fixed a bug causing brief logging to not escape special characters
* Fixed meta refresh redirection but with HTML entities in the URL
* Redesigned and refactored much of Whatweb's code. Introduced the Target class
* Targets from input files are now executed ascending order
* Better support for UTF-8 encoded strings in plugins.
* :status and :url are now logical AND with other matches. They cannot match in isolation unless with each other.
* Updated Country plugin. Fixed IPv6 bug
* Changed version from 0.4.8 to 0.4.8-dev to show development version
* Plugin brief output is now sorted alphabetically by plugin name
* Removed plugin example URLs

Version 0.4.7 Released April 5th 2011
* Performance enhancements & bug fixes
* Added -p + as a shortcut for -p +plugins-disabled
* Added --quiet, -q - to not display brief logging to STDOUT
* Fix Makefile - you can now install whatweb over an old version
* Removed certainty from Mongo and JSON output unless certainty < 100
* Removed certainty info from verbose output unless certainty <100
* Bugfixes for error reporting
* Updated some error messages
* Changed default open and read timeouts to 15 and 30 seconds respectively
* Updated slow plugins
* Added plugins: TVersity, Ultimate-Bulletin-Board, 
* Moved plugins to plugins-disabled: atom_feed, meta-city, meta-contact, meta-country, meta-geography, meta-state, meta-zipcode and script
* Renamed mailto plugin to email

Version 0.4.6 Released March 25th 2011
* Updated ~230 plugins
* Added ~600 new plugins
* Added Escenic CMS plugin from Erik Inge Bolsø
* Added EscenicEngine5 plugin by nikosk
* Added barracuda-load-balancer, binarysec-firewall, citrix-netscaler, cloudflare, evercookie, juniper-netscreen-secure-access, juniper-load-balancer, profense-firewall, vTigerCRM, watchguard-firewall, www-authenticate plugins by Aung Khant
* Moved some plugins into disabled-plugins, as they clutter output. adobe_flash.rb, footer-hash.rb, frame.rb, header-hash.rb, md5.rb, script.rb, shortcut-icon.rb, tagpattern-hash.rb
* Renamed disabled-plugins/ to plugins-disabled/
* Changed $ANEMONE_SKIP_REGEX=Regexp.union line to be compatible with Ruby 1.8.6. Thanks to Michal Ambroz
* Added plugin reporting support for  :model=>, :firmware=>, :module=>
* Added --wait SECONDS between connections. Combine with -t 1 if preferred.
* Added meta-refresh redirect support. eg. <meta http-equiv="refresh" content="0;url=../default/mail/index.html">. Only for non-spidering
* Added {:version=>/regexp/, :offset} to remove cargo cult programming. eg.
{:version=>/<meta name="Generator" (content|CONTENT)="(ASPNUKE|ASP-Nuke) ([^->"]+)/, :offset=>2,  :name=>"meta generator tag" }
* Replaced :probability with :certainty in my-plugins/plugin-template.rb.txt. Thanks Erik Inge Bolsø
* Added support for em-resolv-replace which speeds up whatweb many times. http://github.com/mperham/em-resolv-replace
* Added XML stylesheet "whatweb.xsl" for XML reports
* Added reporting of version detection with matches to the Plugin Info, eg. whatweb -I
* Changed whatweb -I behaviour to search plugins for keywords. eg. './whatweb -I nuke' brings up ASP-Nuke, PHPNuke, DotNetNuke, etc.
* Bugfix: Changed webpage data for when working with files, not URIs. Now it passes empty hashes, etc instead of nil which caused plugins to report errors.
* Added MongoDB logging. Use with --log-mongo-database, --log-mongo-host, --log-mongo-collection, --log-mongo-username, --log-mongo-password. Only database has no default.
* Added JSON logging. Must have the json ruby gem installed or be using Ruby 1.9
* Added MagicTree logging.
* MagicTree logging updated by Gremwell.
* Added error logging.
* Added Verbose logging.
* Added XML header and footer to XML logs
* Modified XML logging to record modules separately
* Bug fix: Escaping the XML log properly for &, <, >, "
* All logs are now flushed/synced
* Bug fix: References to :probability instead of :certainty in some logging
* Changed error message for non resolving hostnames from "undefined method `closed?' for nil:NilClass" to "Cannot resolve hostname"
* Added ascii whatweb logo
* Moved Plugin class into lib/plugins.rb
* Added startup and shutdown for plugins
* Model and Firmware results now display in dark green
* Added :filepath match type
* Added vulnerability matching support, this is still in the experimental phase and not supported.
* Added vulnerability matching code to the awstats plugin.
* Precompiled regular expressions in matches[] for speed improvement
* Changed internal sleep times from 1s to 0.5s
* Added --debug to raise errors found in plugins
* Usage displays faster when no arguments are provided
* Added version string to the help usage
* Added advanced plugin template
* Removed How to write whatweb plugins text file as it's deprecated by the wiki
* Brief output escapes [] and all characters before SPACE with URL encoding
* Added --quiet, -q to suppress Brief Output on stdout by default. Thanks to cdybedahl for this idea.
* Improved OSX compatibility with a patch from matti for symlinks
* Added :status for HTTP Status codes to match[]. :status has a logical AND with a :url, it can't be by itself.
* Updated plugin list and plugin info output
* Bug fix: Now redirects for HTTP statuses 300 through 399. Previously redirected for 301,302 and 307.
* Bug fix: :account didn't have regular expression support
* Changed :modules to :module, deprecated :accounts to :account
* Added redirect control. options are 'never',`http-only', `meta-only', `same-site', `same-domain', 'always'
* Added --max-redirects. Control the maximum number of contiguous redirects followed
* Added custom headers. Can be used multiple times. Examples: --header or -H. eg. "foo:bar" or "user-agent: blinky". Specifying a default header will replace it. Specifying an empty value removes hte header, eg. "User-Agent:"
* Added support for HTTP basic authentication. -u and --user
* Added plugin-development/get-pattern by Aung Khant
* Added to plugin-development/: wget-alexa-top-1m, wget-ip-to-country, alexa-top-1000.txt, alexa-top-100.txt, wikipedia-top-1000.txt
* Added nmap-style IP address range support

Version 0.4.5 Released August 17th 2010
* Added 5 plugins from Tonmoy Saikia. They are: Commonspot, TextPattern, Mediawiki, DUclassified and Mailman
* Added 119 plugins from Brendan Coles. They are: Alcatel-Lucent-Omniswitch, Allinta-CMS, anyInventory, Arab-Portal, AVTech-Video-Web-Server, Barracuda-Spam-Firewall, Basilic, Biromsoft-WebCam, BlueNet-Video-Server, BM-Classifieds, Brother-Printer, BusinessSpace, BXR, Campsite, Canon-Network-Camera, Cisco-VPN-3000-Concentrator, CMSQLite, ColdFusion, coWiki, cpCommerce, CruxCMS, CruxPA, Dell-Printer, D-Link-Network-Camera, DMXReady, DT-Centrepiece, EazyCMS, eLitius, EMO-Realty-Manager, Empire-CMS, envezion~media, eSyndiCat, Evo-Cam, FestOS, Flax-Article-Manager, FluentNET, Forest-Blog, GuppY, HP-LaserJet-Printer, i-Catcher-Console, iDVR, Intellinet-IP-Camera, Interspire-Shopping-Cart, IPCop-Firewall, IQeye-Netcam, iRealty, iScripts-CyberMatch, iScripts-EasySnaps, iScripts-MultiCart, iScripts-ReserveLogic, iScripts-SocialWare, JAMM-CMS, Jamroom, Linksys-NAS, Linksys-Network-Camera, Linksys-Wireless-G-Camera, LocazoList-Classifieds, Lucky-Tech-iGuard, Mobotix-Network-Camera, MyioSoft-Ajax-Portal, My-PHP-Indexer, My-WebCamXP-Server, NetBotz-Network-Monitoring-Device, Netious-CMS, Netsnap-Web-Camera, Nukedit, Open-Blog, ORCA-Platform, ORITE-301-Camera, PageUp-People, Panasonic-Network-Camera, Parked-Domain, PHPDirector, PHPEasyData, phPhotoAlbum, Pixel-Ads-Script, Pixie, Pligg-CMS, PortalApp, Pressflow, RunCMS, sabros.us, samPHPweb, SHOUTcast-Administrator, SimpNews, SkaLinks, SmodCMS, Snap-Appliance-Server, Softbiz-Freelancers-Script, Softbiz-Online-Auctions-Script, Softbiz-Online-Classifieds, Sony-Network-Camera, Sony-Video-Network-Station, Stardot-Express, StarDot-NetCam, Star-Network, Subdreamer-CMS, Subrion-CMS, SyndeoCMS, syntaxCMS, TaskFreak, Team-Board, The-PHP-Real-Estate-Script, TomatoCMS, Toshiba-Network-Camera, Veo-Observer, VisionGS-Webcam, WebDVR, WebEye-Network-Camera, WebPress, WhiteBoard, Winamp-Web-Interface, Windows-Internet-Printing, Xerox-Printers, xGB, XHP-CMS, Zeus-Cart, Zoph, Zyxel-Vantage-Service-Gateway
* Added 11 plugins from Caleb Anderson. They are: AdobeFlash, AtomFeed, CodeIgniterProfiler, DublinCore, MicrosoftODBCError, MysqlSyntaxError, OpenGraphProtocol, OpenID, OpenSearch, PasswordField, RSSFeed
* Updated plugins: Aardvark-Topsites-PHP, Confluence, Open-Source-Ticket-Request-System, PHP-Link-Directory, PHP-Shell, Vulnerable-to-XSS, Zoph
* Updated mailto plugin
* Verbose output now shows which patterns were matched within a plugin
* Fixed bug: Removed Makefile reference to 'disabled-plugins' folder
* Ruby 1.9 compatability fix. requires digest/md5 instead of md5
* Ruby 1.9 compatability fix. Replace UTF8 chars in frog-cms, dotnetnuke and mno-go-search and wordpress-supercache
* Fixed spelling error of verion in help information
* Fixed a typo where -t is shown as the command line option for proxies
* Modified command line usage and is now in 80x24 terminal format
* MD5sum of body is now available as @md5sum to all plugins
* :md5 is available in matches[], eg. {:name=>"must be treshna.com",:md5=>"8666257030b94d3bdb46e05945f60b42"}
* tag pattern of HTML elements in body is now available as @tagpattern to all plugins
* :tagpattern is available in matches[], eg. {:name=>"must be google.com",:tagpattern=>""!doctype,html,head,meta,title,/title,script,/script,style,/style, etc...."}
* :url is available in plugins. eg. {:url=>"/wp-login.php", :text=>'action=lostpassword'}, this will match the url and the text passively and when scanning aggressively, it will request the specified url and check for the text. Another example, {:url=>"/readme.html", :md5=>'9ea06ab0184049bf4ea2410bf51ce402', :version=>"3.0"},
* Added --url-prefix, eg. whatweb --url-prefix www.morningstarsecurity.com/ -i ./guess-files
* Added --url-suffix, eg. whatweb --url-suffix /robots.txt -i ./target-urls
* Added --url-pattern, eg. whatweb --url-pattern www.example.com/%insert%/.htaccess -i ./folder-list
* Added --custom-plugin to define a plugin on the command line. eg, ./whatweb --custom-plugin ":text=>'powered by abc'" -i ./targets   or    --custom-plugin "{:text=>'powered by abc'},{:regexp=>/meta abc/i}" -i ./targets
* Plugin errors are now in red, added target name
* Added --open-timeout and --read-timeout
* Removed div-span plugin, replaced with HTML tag pattern hash
* Added --spider-skip-extensions. Redefine the file extensions that Anemone will skip. The list is comma delimited.
* Moved plugin-template.rb to my-plugins and added more example, comments, etc
* Added $DEBUG = false. If set to true, it will raise errors in plugins to assist plugin development.

Version 0.4.4 Released June 29th 2010
* :probability is renamed to :certainty. :certainty in plugins is no longer required, it defaults to 100 if not specified.
* Fixed bug with ruby 1.8.5 when loading plugins
* Added author names to plugin info, eg. whatweb -I
* Added 67 plugins from Brendan Coles, bringing WhatWeb up to 163 plugins. 360-Web-Manager,ANECMS,AWStats,Aardvark-Topsites-PHP,ArGoSoft-Mail-Server,Axis-Network-Camera,BeEF,BlognPlus,Burning-Board-Lite,CGI,CGIProxy,CMScontrol,CMSimple,Confluence,DUforum,DUgallery,F3Site,File-Upload-Manager,Google-API,Google-Hack-Honeypot,IMGallery,JGS-Portal,Kloxo,Liferay,Lime-Survey,Linksys-USB-HDD,Loggix,Microsoft-Sharepoint,Open-Freeway,Open-Source-Ticket-Request-System,PG-Roomate-Finder-Solution,PHP-Fusion,PHP-Layers,PHP-Link-Directory,PHP-Shell,PHPFM,PHPraid,PhilBoard,Piwik,QNAP-NAS,Saurus-CMS,Site-Sift,TWiki,Trac,Turbo-Seek,Umbraco,VideoShareEnterprise,Virtualmin,Vulnerable-To-XSS,WWWBoard,Web-Calendar-System,Web-Data-Administrator,WoW-Raid-Manager,X7-Chat,Zen-Cart,Zikula,boastMachine,ezBOO-WebStats,jobberBase,mojoPortal,php-ping,phpFreeChat,phpMyAdmin,phpPgAdmin,phpSysInfo,phpinfo,uPortal
* Added references to Security-Assessment.com
* Updates to README, CHANGELOG, plugin-template.rb.txt

Version 0.4.3 Released May 24th 2010
* Added GPLv2 notices
* Added Makefile (Thanks Michal Ambroz <rebus AT seznam.cz>)
* Added man pages (Thanks Michal Ambroz <rebus AT seznam.cz>)
* Added --version
* Added Invalid command line argument handling
* Added @cookie variable to plugins but is not availble for recursive use
* Changed output colour of page titles
* Changed plugin names to use a CamelCase convention
* Merged the google analytics GA and Urchin plugins
* Modified MovableType plugin
* Added Cookie names plugin
* Added Concrete5 CMS plugin
* Added CushyCMS plugin
* Added FrogCMS plugin
* Added ModxCMS plugin
* Added TypoLight plugin
* Added ExpressionEngine plugin
* Fixed a bug in Tomcat plugin
* New feature, my-plugins/ folder. Keep your personal plugins separate.
* Usage info shows correct defaults
* Fixed a bug where aggressive plugins didn't use the proxy settings
* Added XML (naive) logging
* Updated usage to show how to pipe HTML to /dev/stdin
* Added --no-redirect option. Do not follow HTTP 3xx redirects

Version 0.4.2 Released April 30th 2010
* Added header-hash plugin. Makes a hash of the first 500 characters. This is useful to identify unknown systems
* Added footer-hash plugin. Makes a hash of the last 500 characters, only if the page has > 1000 characters. This is useful to identify unknown systems
* Added div-span-structure plugin. Makes a hash of a signature of div and span tags. This is useful to identify unknown systems
* Added MikroTik Router plugin. Recognises version
* Fixed a bug where the URL had a ? suffix. This caused some types of http servers to repspond incorrectly.
* Added SquirrelMail plugin. Recognises version
* Added SearchFitShoppingCart plugin. Recognises version
* Added RoundCube plugin.
* Modified OSCommerce plugin. Recognises security warnings about file permissions and installation directory.
* Changed output colour to be more readable. Plugins that create hashes are in grey
* Changed output order of plugins, so plugins that create hashes come last

Version 0.4.1 Released April 28th 2010
* Removed dependency on rubygems and libxslt by modifying and locally including the Anemone gem. This also simplified installation
* Fixed a bug which didn't send URL parameters. eg. would send /index.php instead of /index.php?q=foo
* Improved installation instructions. Henri Salo contacted me to say ruby-dev is required for Anemone
* Removed UTF-8 character in formmail
* Changed require 'md5' to require 'digest/md5' for compatibility with ruby 1.9 
* Fixed bug in Tomcat plugin
* Added SilverStripe plugin
* Added DotNetNuke plugin
* Added HTML5 plugin
* Added PHP error plugin
* Modified PHP-Nuke plugin
* Changed the plugin development script, wget-list to retry only twice
* Added proxy support
* Default threads is now 25
* Default max recursive spidering depth is now 10
* Default max number of links to follow on a single page is now 250

Version 0.4 Released March 13th 2010
* Added HTTPS support
* Improved installation instructions
* Improved documentation
* Better compatibility with ruby 1.9. Changed a case statement syntax, changed when 0: to when 0 then.
* Removed UTF-8 characters in plugins that were causing crashes
* Added php-nuke plugin, passively recognises modules
* Added Fluxbb plugin, can identify versions aggressively
* Added meta powered-by plugin. Matches tags like <meta name="powered-by" content="abc/1.23" />
* Added powered by plugin. Matches "Powered by BobsCMS", any text following powered by
* Improved plugin info listing invoked by ./whatweb -I. Shows number of examples and matches, and shows presence of passive and aggressive functions
* Changed output style. Before strings are surrounded by single quotes, now all strings are surrounded by square brackets
* Added OpenCMS plugin submitted by Emilio Casbas
* Added TomCat plugin submitted by Louis Nyffenegger
* Improved meta-generator plugin
* Fixed a bug in processing a target list from a file where a trailing space would be interpreted incorrectly

Version 0.3 Released November 2nd 2009 at Kiwicon III


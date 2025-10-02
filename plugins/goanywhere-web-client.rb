##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
#
Plugin.define do
        name "GoAnywhere-Web-Client"
        authors [
                "Francesco Pavanello <frapava98@gmail.com>", # v0.1 # 2025-10-01 # Created plugin
        ]
        version "0.1"
        description "Fortra GoAnywhere is a Managed File Transfer (MFT) solution designed to help organizations securely and efficiently exchange data with trading partners, employees, and internal systems>
        website "https://www.goanywhere.com/"

        # This is the matches array.
        # Each match is treated independently.

        # Dorks #
        dorks [
                'intitle:"GoAnywhere Web Client"'
        ]


        # Matches #
        matches [
        # This searches for a text string.
        { :text => "<title>GoAnywhere Web Client - Login</title>" },
        { :text => "<div id=\"footer\">Powered by <a href=\"https://www.GoAnywhere.com/powered-by\" target=\"_blank\">GoAnywhere</a></div>" },
        ]

end

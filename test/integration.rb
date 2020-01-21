##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
require 'minitest/autorun'
require 'json'

class WhatWebTest < Minitest::Test

  def setup
    @test_host = 'whatweb.net'
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
  rescue JSON::ParserError
    return false
  end

  def test_version
    p = IO.popen(['./whatweb', '--version'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{^WhatWeb version ([\d\.]+(-dev)?) \( https://www.morningstarsecurity.com/research/whatweb/ \)$}
  end

  def test_usage
    p = IO.popen(['./whatweb', '--help'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ /^WhatWeb - Next generation web scanner version ([\d\.]+(-dev)?)\.$/
  end

  def test_invalid_url
    res = IO.popen(['./whatweb','--color', 'never', 'https://'], :err => [ :child, :out ]).read
    assert_match %r{No targets selected}, res
  end

  def test_xml_output
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-xml', '/dev/stdout',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{<http-status>200</http-status>}
  end

  def test_json_output
    res = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-json', '/dev/stdout',
      "https://#{@test_host}/"],
      :err => [ :child, :out ]).read

    assert_match %r{"http_status":200}, res
  end

  def test_json_output_with_empty_input 
    res = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-json','/dev/stdout',
      '--quiet',
      '--no-errors',
      '--input-file','/dev/null'], :err => [ :child, :out ]).read

    assert valid_json?(res)
  end


  def test_object_output
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-object', '/dev/stdout',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{Identifying: https://#{@test_host}/}
    assert res =~ %r{^HTTP-Status: 200$}
    assert res =~ %r{:name=>"server string", :string=>"Apache", :certainty=>100}
  end

  def test_sql_output
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-sql', '/dev/stdout',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    lines = res.split("\n").flatten
    assert lines[0] =~ %r{^INSERT IGNORE INTO request_configs \(value\)}
    assert lines[1] =~ %r{^INSERT IGNORE INTO targets \(status,target\) VALUES \('200','https://#{@test_host}/'\);$}
  end

  def test_verbose_output
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--verbose',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res.split("\n").flatten.first =~ %r{WhatWeb report for https://#{@test_host}/$}
  end

  def test_plugins
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '-phttpserver,title',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{^https://#{@test_host}/ \[200 OK\] HTTPServer\[Apache\], Title\[WhatWeb - Next generation web scanner.\]$}
  end

  def test_custom_plugin
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--custom-plugin', ':text=>"WhatWeb - Next generation web scanner."',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{Custom-Plugin}
  end

  def test_invalid_custom_plugin
    junk = "#{('a'..'z').to_a.shuffle[0,8].join}"
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--no-errors',
      '--custom-plugin', ":text=>#{junk}",
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_equal '', res
  end

  def test_list_plugins
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--list'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{Total: [\d]+ Plugins}
  end


  def test_info_plugins
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--info-plugins','wordpress'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{www.wordpress.org}
  end

  def test_search_plugins
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--search','struts'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{struts.apache.org}
  end

  def test_grep_plugin
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--grep', 'Next generation web scanner',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_match %r{, Grep,}, res
  end

  def test_dorks
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--dorks', 'wordpress',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{is proudly powered by WordPress}
  end

  def test_quiet
    p = IO.popen(['./whatweb',
      '--quiet',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_empty res
  end

  def test_no_errors
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--no-errors',
      "https://#{@test_host}:99/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    refute res =~ %r{ERROR:}
  end

  def test_url_suffix
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--url-suffix','robots.txt',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_match %r{rm -rf}, res
  end

  def test_url_prefix
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--url-prefix','https://',
      "#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_match %r{WhatWeb - Next generation web scanner.}, res
  end
  

  def test_inform_user_deprecated_plugin

    res = IO.popen(['./whatweb',
    '-p','./test/plugins/deprecated-plugin-format.rb',
    "https://#{@test_host}/"], :err => [ :child, :out ]).read

      assert_includes res, "This plugin may be using a deprecated plugin format"
  end


  def test_idn_domains
    p = IO.popen(['./whatweb',
      '--color', 'never',
      "http://www.詹姆斯.com/"], 'r+')

    res = p.read.to_s
    p.close
    assert res
    assert_includes res, "http://www.xn--8ws00zhy3a.com/ [200 OK]"
  end

end


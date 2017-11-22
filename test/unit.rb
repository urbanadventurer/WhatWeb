##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
require 'minitest/autorun'

class WhatWebTest < Minitest::Test

  def setup
    @test_host = 'whatweb.net'
  end

  def test_version
    p = IO.popen(['./whatweb', '--version'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{^WhatWeb version \d.\d.\d[-dev]? \( http://www.morningstarsecurity.com/research/whatweb/ \)$}
  end

  def test_invalid_url
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--no-errors',
      'https://'], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert_equal '', res
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
    p = IO.popen(['./whatweb',
      '--color', 'never',
      '--log-json', '/dev/stdout',
      "https://#{@test_host}/"], 'r+')
    res = p.read.to_s
    p.close
    assert res
    assert res =~ %r{"http_status":200}
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
    assert res.split("\n").flatten.first =~ %r{^INSERT IGNORE INTO targets \(status,target\) VALUES \('200','https://#{@test_host}/'\);$}
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

end


require "test_helper"

class PurgeTest < Minitest::Test
  def setup
    @upyun = Upyun::Purge.new
  end

  def test_purge
    result = @upyun.purge("http://xx.xxxx.com/xxx.jpg")
  end


  def test_purge_mult
    result = @upyun.purge(["http://xx.xxxx.com/xxx.jpg","http://bb.bbb.com/bbb.jpg"])

  end


  def test_md5
    assert_equal("5f4dcc3b5aa765d61d8327deb882cf99", @upyun.md5("password"))
  end

end
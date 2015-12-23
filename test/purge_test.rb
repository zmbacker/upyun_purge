require "test_helper"

class PurgeTest < Minitest::Test
  def setup
    @upyun = Upyun::Purge.new
  end

  def test_purge
    result = @upyun.purge("http://xx.xxxx.com/xxx.jpg")
    assert_equal true, result.key?("invalid_domain_of_url")
  end


  def test_purge_mult
    result = @upyun.purge(["http://xx.xxxx.com/xxx.jpg","http://bb.bbb.com/bbb.jpg"])
    assert_equal true, result.key?("invalid_domain_of_url")
  end

  def test_md5
    assert_equal("5f4dcc3b5aa765d61d8327deb882cf99", @upyun.md5("password"))
  end


  def test_call_method
    upyun = Upyun::Purge.new(bucket_name: Upyun::Purge.bucket_name ,operator_name: Upyun::Purge.operator_name ,operator_password: Upyun::Purge.operator_password )
    result = upyun.purge("http://docs.upyun.com/css/bootstrap.min.css")
    assert_equal true, result.key?("invalid_domain_of_url")
  end

end
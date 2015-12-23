# Upyun::Purge

Help you purge the cache on upyun.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'upyun-purge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install upyun-purge

## Usage


```ruby

  upyun = Upyun::Purge.new(bucket_name: "xxxx", operator_name: "xxxxx", operator_password: "xxxxxx")

  upyun.purge("http://xx.xxxx.com/xxx.jpg")

  upyun.purge(["http://xx.xxxx.com/xxx.jpg","http://bb.bbb.com/bbb.jpg"])


```


```ruby

Upyun::Purge.setup do |config|

  # bucket name
  config.bucket_name = "testid"

  # operator name
  config.operator_name = "testsecret"

  # operator password
  config.operator_password = "password"

end

upyun = Upyun::Purge.new
result = upyun.purge("http://xx.xxxx.com/xxx.jpg")
result = upyun.purge(["http://xx.xxxx.com/xxx.jpg","http://bb.bbb.com/bbb.jpg"])

```




## Contributing

1. Fork it ( https://github.com/zmbacker/upyun-purge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

module Upyun
  module Purge
    class Client

      attr_accessor :urls

      def purge( urls = nil)
        @urls = urls.is_a?(Array) ? urls : [urls]
        @urls = @urls.compact

        uri = URI(Upyun::Purge.api_server)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data( purge: @urls.join("\n") )
        request['Authorization'] = auth_header
        request['Date'] = Time.now
        response = http.request(request)
        case response
        when Net::HTTPSuccess
          return response.body
        else
          raise Exception.new "Request uri:#{uri.request_uri} \nResponse code: #{response.code} \nMessage: #{response.body}"
        end

      end




      def make_signature
        _urls = @urls.join("\n")
        datetime = Time.now
        second_str = [_urls,Upyun::Purge.bucket_name, datetime, md5(Upyun::Purge.operator_password)].join("&")
        sign = md5(second_str)
        sign
      end

      def auth_header
        "UpYun #{Upyun::Purge.bucket_name}:#{Upyun::Purge.operator_name}:#{make_signature}"
      end

      def md5( str )
        Digest::MD5.hexdigest str
      end

    end
  end
end

module LcApi
  class Base < ActiveResource::Base
    self.site = "http://lctv-api.herokuapp.com/v1"

    class << self
      attr_accessor :api_key
    end

    def self.find(*args)
      scope   = args.slice!(0)
      options = args.slice!(0) || {}

      if options.has_key? :include
        options[:params] = (options[:params] || {}).merge({include: options[:include].join(",")})
      end


      options[:params] = (options[:params] || {}).merge({key: LcApi.key})

      super(scope, options)
    end
  end
end
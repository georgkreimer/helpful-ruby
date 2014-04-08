module Helpful

  module HttpClient

    # RequestHandler takes care of encoding the request body into format given by options
    class RequestHandler

      def self.set_body(options)
        type = options.has_key?(:request_type) ? options[:request_type] : "json"

        # Encoding request body into JSON format
        if type == "json"
          options[:body] = options[:body].to_json
          options[:headers]["content-type"] = "application/json"
        end

        # Raw body
        if type == "raw"
          options[:body] = options[:body].is_a?(Hash) ? "" : options[:body]
          options[:headers].delete "content-type"
        end

        return options
      end

    end

  end

end

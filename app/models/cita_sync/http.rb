module CitaSync
  module Http
    class << self
      # post params to cita and get response
      #
      # @param method [String, Symbol]
      # @param jsonrpc [String] jsonrpc version, default with "2.0" and only can be "2.0"
      # @param id [Integer] rpc id, default with 83
      # @return [Faraday::Response] http response
      def post(method, jsonrpc: "2.0", params: [], id: 83)
        conn.post("/", params(method, jsonrpc: jsonrpc, params: params, id: id))
      end

      # wrapper params for cita with default params and to json
      #
      # @param method [String, Symbol] rpc method name
      # @param jsonrpc [String] jsonrpc version, default with "2.0" and only can be "2.0"
      # @param id [Integer] rpc id, default with 83
      # @return [String] params in json
      def params(method, jsonrpc: "2.0", params: [], id: 83)
        {
          jsonrpc: jsonrpc,
          id: id,
          method: method,
          params: params
        }.to_json
      end

      # wrapper faraday object with cita_url and Content-Type
      #
      # @return [Faraday]
      def conn
        Faraday.new(url: cita_url) do |faraday|
          faraday.headers['Content-Type'] = 'application/json'
          faraday.request  :url_encoded             # form-encode POST params
          # faraday.response :logger                  # log requests to $stdout
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        end
      end

      # get CITA_URL in ENV
      #
      # @return [String] cita chain url (with port if need) like http://www.example.com
      def cita_url
        ENV.fetch("CITA_URL")
      end
    end

  end
end

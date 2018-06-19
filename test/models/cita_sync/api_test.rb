require 'test_helper'

class CitaSync::ApiTest < ActiveSupport::TestCase
  setup do
    ENV["CITA_URL"] = "http://www.cita.com"

    stub_request(:post, "www.cita.com").
      with(body: hash_including({ method: "cita_blockNumber" }), headers: { "Content-Type": "application/json" }).
      to_return(status: 200, body: { jsonrpc: "2.0", id: 83, result: "0x7781" }.to_json)


    result = { "version" => 0,
               "hash" => "0xa18f9c384107d9a4fcd2fae656415928bd921047519fea5650cba394f6b6142b",
               "header" =>
                 { "timestamp" => 1528702183591,
                   "prevHash" => "0xda8991b9cbc7f7bc56e94abbd7056dffc501603a4ab6bcaa7e2ed08b3e58e554",
                   "number" => "0x1",
                   "stateRoot" => "0x048523e8326427968d05673210cc77a8f76e60d0b9170d1bdc1d49c131da9c85",
                   "transactionsRoot" => "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
                   "receiptsRoot" => "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
                   "gasUsed" => "0x0",
                   "proof" => nil,
                   "proposer" => "0x91827976af27e1fd405469b00dc8d3b0ea2203f6" },
               "body" => { "transactions" => [] } }
    stub_request(:post, "www.cita.com").
      with(body: hash_including({ method: "cita_getBlockByNumber", params: ["0x1", true] }), headers: { "Content-Type": "application/json" }).
      to_return(status: 200, body: { jsonrpc: "2.0", id: 83, result: result }.to_json)

  end

  test "cita_blockNumber" do
    resp = CitaSync::Api.cita_block_number

    assert resp["jsonrpc"], "2.0"
    assert resp["id"], 83
    assert resp["result"], "0x7781"
  end

  test "cita_getBlockByNumber" do
    resp = CitaSync::Api.cita_get_block_by_number(["0x1", true])

    assert resp.dig("result", "hash"), "0xa18f9c384107d9a4fcd2fae656415928bd921047519fea5650cba394f6b6142b"
  end

end

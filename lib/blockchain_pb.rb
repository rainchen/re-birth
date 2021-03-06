# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: blockchain.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "Proof" do
    optional :content, :bytes, 1
    optional :type, :enum, 2, "ProofType"
  end
  add_message "BlockHeader" do
    optional :prevhash, :bytes, 1
    optional :timestamp, :uint64, 2
    optional :height, :uint64, 3
    optional :state_root, :bytes, 4
    optional :transactions_root, :bytes, 5
    optional :receipts_root, :bytes, 6
    optional :gas_used, :uint64, 7
    optional :gas_limit, :uint64, 8
    optional :proof, :message, 9, "Proof"
    optional :proposer, :bytes, 10
  end
  add_message "Status" do
    optional :hash, :bytes, 1
    optional :height, :uint64, 2
  end
  add_message "AccountGasLimit" do
    optional :common_gas_limit, :uint64, 1
    map :specific_gas_limit, :string, :uint64, 2
  end
  add_message "RichStatus" do
    optional :hash, :bytes, 1
    optional :height, :uint64, 2
    repeated :nodes, :bytes, 3
    optional :interval, :uint64, 4
  end
  add_message "ProtoTransaction" do
    optional :to, :string, 1
    optional :nonce, :string, 2
    optional :quota, :uint64, 3
    optional :valid_until_block, :uint64, 4
    optional :data, :bytes, 5
    optional :value, :bytes, 6
    optional :chain_id, :uint32, 7
    optional :version, :uint32, 8
  end
  add_message "UnverifiedTransaction" do
    optional :transaction, :message, 1, "ProtoTransaction"
    optional :signature, :bytes, 2
    optional :crypto, :enum, 3, "Crypto"
  end
  add_message "SignedTransaction" do
    optional :transaction_with_sig, :message, 1, "UnverifiedTransaction"
    optional :tx_hash, :bytes, 2
    optional :signer, :bytes, 3
  end
  add_message "BlockBody" do
    repeated :transactions, :message, 1, "SignedTransaction"
  end
  add_message "ProtoBlock" do
    optional :version, :uint32, 1
    optional :header, :message, 2, "BlockHeader"
    optional :body, :message, 3, "BlockBody"
  end
  add_message "BlockWithProof" do
    optional :blk, :message, 1, "ProtoBlock"
    optional :proof, :message, 2, "Proof"
  end
  add_message "BlockTxs" do
    optional :height, :uint64, 1
    optional :body, :message, 3, "BlockBody"
  end
  add_message "BlackList" do
    repeated :black_list, :bytes, 1
    repeated :clear_list, :bytes, 2
  end
  add_enum "ProofType" do
    value :AuthorityRound, 0
    value :Raft, 1
    value :Tendermint, 2
  end
  add_enum "Crypto" do
    value :SECP, 0
    value :SM2, 1
  end
end

Proof = Google::Protobuf::DescriptorPool.generated_pool.lookup("Proof").msgclass
BlockHeader = Google::Protobuf::DescriptorPool.generated_pool.lookup("BlockHeader").msgclass
Status = Google::Protobuf::DescriptorPool.generated_pool.lookup("Status").msgclass
AccountGasLimit = Google::Protobuf::DescriptorPool.generated_pool.lookup("AccountGasLimit").msgclass
RichStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("RichStatus").msgclass
ProtoTransaction = Google::Protobuf::DescriptorPool.generated_pool.lookup("ProtoTransaction").msgclass
UnverifiedTransaction = Google::Protobuf::DescriptorPool.generated_pool.lookup("UnverifiedTransaction").msgclass
SignedTransaction = Google::Protobuf::DescriptorPool.generated_pool.lookup("SignedTransaction").msgclass
BlockBody = Google::Protobuf::DescriptorPool.generated_pool.lookup("BlockBody").msgclass
ProtoBlock = Google::Protobuf::DescriptorPool.generated_pool.lookup("ProtoBlock").msgclass
BlockWithProof = Google::Protobuf::DescriptorPool.generated_pool.lookup("BlockWithProof").msgclass
BlockTxs = Google::Protobuf::DescriptorPool.generated_pool.lookup("BlockTxs").msgclass
BlackList = Google::Protobuf::DescriptorPool.generated_pool.lookup("BlackList").msgclass
ProofType = Google::Protobuf::DescriptorPool.generated_pool.lookup("ProofType").enummodule
Crypto = Google::Protobuf::DescriptorPool.generated_pool.lookup("Crypto").enummodule

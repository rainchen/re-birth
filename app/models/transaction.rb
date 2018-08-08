class Transaction < ApplicationRecord
  belongs_to :block

  delegate :timestamp, to: :block

  # validates :block, presence: true
  validates :cita_hash, presence: true, uniqueness: true
end

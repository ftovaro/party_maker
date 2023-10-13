class Party < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :polls, dependent: :delete_all

  after_create_commit -> { broadcast_prepend_to "parties" }
end

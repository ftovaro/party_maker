class Item < ApplicationRecord
  belongs_to :poll
  has_many :votes, dependent: :delete_all

  after_create_commit -> { broadcast_append_to self.poll.party, target: "poll_#{self.poll.id}_items_container" }
  after_destroy_commit -> { broadcast_remove_to self.poll.party, target: self }
end

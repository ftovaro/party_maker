class Poll < ApplicationRecord
  validates :name, presence: true
  enum status: {
    pending: 0,
    completed: 1
  }

  has_many :items, dependent: :delete_all
  belongs_to :party

  after_create_commit -> { broadcast_append_to self.party, target: "party_#{self.party.id}_polls_container" }
  after_destroy_commit -> { broadcast_remove_to self.party, target: self }
end

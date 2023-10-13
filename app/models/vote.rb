class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :item

  after_create_commit -> { broadcast_replace_to self.item.poll.party, partial: 'items/item', locals: { item: self.item }, target: self.item }
  after_destroy_commit -> { broadcast_replace_to self.item.poll.party, partial: 'items/item', locals: { item: self.item }, target: self.item }
end

class Party < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :polls, dependent: :delete_all
end

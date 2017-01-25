class ProgressComment < ApplicationRecord
  belongs_to :progress
  belongs_to :user
end

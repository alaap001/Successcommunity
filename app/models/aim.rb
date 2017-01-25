class Aim < ApplicationRecord
has_many :progresses , dependent: :destroy
belongs_to :user

validates :head, presence: true
validates :content, presence: true
validates :day, presence: true

end

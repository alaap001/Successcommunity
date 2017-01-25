class Progress < ApplicationRecord
belongs_to :aim
belongs_to :user
has_many :progress_comments, dependent: :destroy
validates :content, presence: true
validates :progress_head, presence: true
mount_uploader :Progressimage , ProgressimageUploader
end

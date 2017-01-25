class Post < ApplicationRecord
belongs_to :user
acts_as_votable
validates :title, presence: true
validates :content, presence: true


has_many :comments , dependent: :destroy

mount_uploader :Postimage, PostimageUploader
end

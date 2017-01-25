class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :aims, dependent: :destroy
         has_many :progress_comments, dependent: :destroy
         has_many :progresses, dependent: :destroy
         has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id"
has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id", dependent: :destroy
has_many :following, through: :active_relationships, source: :followed, dependent: :destroy
has_many :followers, through: :passive_relationships, source: :follower, dependent: :destroy

acts_as_voter
mount_uploader :profilepic , ProfilepicUploader

# Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end


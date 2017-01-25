class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @post = Post.where(user_id: @user)
  # @user_pic = current_user.build(require(:users).permit(:profilepic))
  end

 def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
   
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followin
    
  end


end

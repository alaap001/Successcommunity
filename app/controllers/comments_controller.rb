class CommentsController < ApplicationController

before_action :authenticate_user!

def create
@post = Post.find(params[:post_id])
@comment = @post.comments.build(comment_params)
@comment.user_id = current_user.try(:id)

if(@comment.save)
	redirect_to post_path(@post)
else
	render 'new'

end
end

def destroy
	@post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id])
 @comment.destroy
 redirect_to @post
end

def new
end

def update
			@post = Post.find(params[:post_id])
	
if @post.comments.update(comment_params)
	redirect_to @post
else
	render 'edit'
end
end

def edit
		@post = Post.find(params[:post_id])
	@comment = Comment.find(params[:id])
end

private

def comment_params
params.require(:comment).permit(:content)
	end

end

class PostsController < ApplicationController

before_action :find_params, only:[:upvote,:downvote,:show,:edit,:destroy,:update]
before_action :authenticate_user!, except: [:index, :show]

  def index
  	@post = Post.all.order('created_at DESC')

  end

def display
@post = current_user.posts.all.order('created_at DESC')
end

  def new
  	@post = current_user.posts.build
  end
  
  def upvote
    @post.upvote_by current_user
   
     respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
  end
  def downvote
    @post.downvote_by current_user
     
     respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
  end
  def create
  @post = current_user.posts.build(post_params)
  if @post.save
  	redirect_to @post
  else
  	render 'new'
  end
  end

  def show
  @comment = Comment.where(post_id: @post)
  end

  def update
if @post.update(post_params)
	redirect_to @post
else
	render 'edit'
end
  end

 def destroy
@post.destroy
redirect_to root_path
 end

  def edit

  end

  private 

  def find_params
@post = Post.find(params[:id])
  end

  def post_params
params.require(:post).permit(:title,:day_head,:content,:Postimage)
  end
end
 
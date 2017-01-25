class ProgressesController < ApplicationController

before_action :authenticate_user!, except: [:index,:show]

def index
	
@progress = Progress.paginate(page: params[:page], per_page: 3).order('created_at DESC')
@posts = Post.all.order('RAND()').first
respond_to do |format|
  format.html
  format.js
 end
end

def new
	@aim = Aim.find(params[:aim_id])
	@progress = @aim.progresses.build
end

def create
@aim = Aim.find(params[:aim_id])
@progress = @aim.progresses.create(progress_params)
@progress.user_id = current_user.id

if(@progress.save)
	redirect_to @aim
else
	render 'new'
end
end

def show
@aim = Aim.find(params[:aim_id])
@progress = Progress.find(params[:id])
@comment = ProgressComment.where(progress_id: @progress)
end

private
def progress_params
params.require(:progress).permit(:progress_head,:content,:Progressimage)
end
end

class ProgressCommentsController < ApplicationController
before_action :authenticate_user!

def create
@progress = Progress.find(params[:progress_id])
@aim = Aim.find(params[:aim_id])
@comment = @progress.progress_comments.build(params[:progress_comment].permit(:content))
@comment.user_id = current_user.try(:id)

if @comment.save
	respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
else
render 'new'
end
end

def destroy
@aim = Aim.find(params[:aim_id])
@progress = Progress.find(params[:progress_id])
@comment = ProgressComment.find(params[:id])
@comment.destroy
respond_to do |format|
    format.html { redirect_to :back }
    format.js { render layout: false }
  end
end

end

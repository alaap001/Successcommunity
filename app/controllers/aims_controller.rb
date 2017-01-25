class AimsController < ApplicationController
before_action :authenticate_user!, except: [:show]

def index
@aim = current_user.aims.all.order('created_at DESC')
end

def new
@aim = current_user.aims.build
end

def create
@aim = current_user.aims.build(aim_params)
if @aim.save
	redirect_to @aim
else
	render 'new'
end
end

def show
 @aim = Aim.find(params[:id])

	unless @aim.user == current_user
		redirect_to root_path
end
end

private
def aim_params
params.require(:aim).permit(:head,:day,:content)
	end
end

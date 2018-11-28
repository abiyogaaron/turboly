class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show,:finished] 
  
  def index
  	if (user_signed_in?)
  		@tasks = Task.where("user_id = ?", current_user.id)
  		@tasksToday = Task.where("taskDate = ? and taskStatus = ? and user_id = ?", Date.today, "not finished", current_user.id)
  		#render plain: @tasksToday.inspect
  	end
  end

  def new

  end

  def show
  	if(current_user.id.to_s)
  		@task = Task.find_by(id: params[:id],user_id: current_user.id.to_s)
  	else
  		redirect_to action: "index"
  	end
  end

  def finished
  	@task = Task.find_by(id: params[:id])
  	if (@task.update(taskStatus: 'finished'))
  		redirect_to action: "index"
  	end
  end

  def create
  	@task = Task.new(task_params)
  	@task.save
  	redirect_to action: "index"
  end

  private
  	def task_params
  		params.require(:task).permit(:taskName,:taskDate,:taskPriority,:taskStatus,:user_id,:description)
  	end
end

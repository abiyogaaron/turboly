class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new,:show,:finished] 
  
  def index
  	if (user_signed_in?)
  		@tasks = Task.where("user_id = ?", current_user.id)
  		@tasksToday = Task.where('task_date = ? and task_status = ? and user_id = ?', Date.today, "not finished", current_user.id)
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
  	if (@task.update(task_status: 'finished'))
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
  		params.require(:task).permit(:taskName,:task_date,:taskPriority,:task_status,:user_id,:description)
  	end
end

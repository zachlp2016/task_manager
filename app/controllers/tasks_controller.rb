class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.all
  end

  def new
    # @task = Task.new(params)
  end

  def create
    @task = Task.new({title: params[:task][:title], description: params[:task][:description]})
    @task.save
    redirect_to '/tasks'
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update

    @task = Task.find(params[:id])
    @task.update({title: params[:task][:title], description: params[:task][:description]})
    @task.save

    redirect_to "/tasks/#{@task.id}"
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end

  #
  # private
  #
  # def permitted_params
  #   params.require(:id).permitted(:title, :description)
  #
  # end


end

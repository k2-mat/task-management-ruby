class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks
  def index
    @search = current_user.tasks.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @tasks = @search.result.page(params[:page])
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash.now.notice = "Successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      flash.now.notice = "Successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    flash.now.notice = "Successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :body)
    end
end

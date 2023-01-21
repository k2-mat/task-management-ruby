class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks
  def index
    @search = Task.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @tasks = @search.result.page(params[:page])
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      flash.now.notice = "タスクを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      flash.now.notice = "タスクを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    flash.now.notice = "タスクを削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :body)
    end
end

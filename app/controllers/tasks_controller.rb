class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    project = Project.find(params[:project_id])
    @tasks = project.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    project = Project.find(params[:project_id])
    @task = project.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    project = Project.find(params[:project_id])
    @task = project.tasks.build
    @task.status = 'new'
  end

  # GET /tasks/1/edit
  def edit
    project = Project.find(params[:project_id])
    @task = project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    project = Project.find(params[:project_id])
    @task = project.tasks.create(task_params)
    @task.status = 'new'
    respond_to do |format|
      if @task.save
        format.html { redirect_to [@task.project, @task], notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: [@task.project, @task] }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    project = Project.find(params[:project_id])
    @task = project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to [@task.project, @task], notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: [@task.project, @task] }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    project = Project.find(params[:project_id])
    @task = project.tasks.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_status
    task = Task.find(params[:id])
    case task.status
    when "new"
      task.status = 'in progress'
    when "in progress"
      task.status = 'done'
    end
    task.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :status, :progect_id, user_ids: [])
    end
end

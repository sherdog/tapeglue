class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  before_filter :authenticate_user!
  
  def index
    @tasks = Task.find(:all, :conditions => {:assigned_user_id => current_user.id}, :order => "created_at DESC")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    1.times { @task.assets.build }
   
    @all_users = User.find(:all)
    @priorities = Priority.find(:all)
    @assignees = User.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit

    @task = Task.find(params[:id])
    1.times { @task.assets.build }
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    @task.user_id = current_user.id
    @task.title = params[:task][:title]
    @task.task = params[:task][:task]
    @task.date_due = Date.parse(params[:task][:date_due])
    @task.priority_id = params[:task][:priority_id]
    @task.category_id = params[:task][:category_id]
    @task.assigned_user_id = params[:task][:assigned_user_id]

  #  @task = current_user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    @task.user_id = current_user
    @task.date_due = Date.parse(params[:task][:date_due])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end

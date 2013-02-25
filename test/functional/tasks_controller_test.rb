require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { assigned_to: @task.assigned_to, created_by: @task.created_by, date_added: @task.date_added, date_added: @task.date_added, modified_date: @task.modified_date, priority_id: @task.priority_id, task: @task.task, title: @task.title }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    put :update, id: @task, task: { assigned_to: @task.assigned_to, created_by: @task.created_by, date_added: @task.date_added, date_added: @task.date_added, modified_date: @task.modified_date, priority_id: @task.priority_id, task: @task.task, title: @task.title }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end

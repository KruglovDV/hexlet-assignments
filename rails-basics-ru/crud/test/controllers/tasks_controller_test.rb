require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'opens all tasks page' do
    get tasks_path
    assert_response :success
  end

  test 'opens new task page' do
    get new_task_path
    assert_response :success
  end

  test 'creates new task' do
    new_task = { name: 'new task', description: 'new task description', creator: 'Ivan', completed: false }
    post tasks_path, params: { task: new_task }

    created_task = Task.find_by(new_task)

    assert created_task
    assert_redirected_to task_path created_task
  end

  test 'shows task' do
    get task_path tasks(:one)
    assert_response :success
  end

  test 'opens edit task form' do
    get edit_task_path tasks(:one)
    assert_response :success
  end

  test 'updates task' do
    update_params = { name: 'updated task', description: 'updated task description', creator: 'Ivan', completed: true }

    put task_path(tasks(:one)), params: { task: update_params }
    updated_task = Task.find_by(update_params)
    assert updated_task[:id] == tasks(:one)[:id]
    assert_response :redirect
    assert_redirected_to task_path updated_task
  end

  test 'destroys task' do
    task_to_delete = tasks(:one)
    delete task_path(task_to_delete)

    deleted_task = Task.find_by(id: task_to_delete[:id])

    assert deleted_task.nil?
    assert_redirected_to tasks_path
  end
end

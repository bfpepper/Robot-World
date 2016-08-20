require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def current_task_id
    task_manager.all.last.id
  end

  def create_robot
    robot_world.create({:name => "Troy", :city => "Bailey", :state => "CO", :birthdate => "03-14-1987", :date_hired => "3-15-2013", :department => "account managment"})
    robot_world.create({:name => "Denton", :city => "Somewhere", :state => "NC", :birthdate => "07-15-1988", :date_hired => "3-15-2012" :department => "sales"})
    robot_world.create({:name => "Conrad", :city => "Chicago", :state => "IL", :birthdate => "08-14-1987", :date_hired => "08-14-1987" :department => "sales"})
  end

  def test_task_is_created
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
    task = task_manager.find(current_task_id)

    assert_equal "Some title", task.title
    assert_equal "Some description", task.description
  end

  def test_it_returns_all_tasks
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
    task_manager.create({
      :title => "Some other title",
      :description => "Some other description"
      })
    task_manager.create({
      :title => "Yet another title",
      :description => "Yet another description"
      })

    assert_equal 3, task_manager.all.count
    assert_instance_of Task, task_manager.all.first
  end

  def test_it_finds_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
    task_manager.create({
      :title => "Some other title",
      :description => "Some other description"
      })
    task_manager.create({
      :title => "Yet another title",
      :description => "Yet another description"
      })

      task = task_manager.find(current_task_id)

      assert_instance_of Task, task
  end

  def test_it_deletes_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })
    assert_equal 1, task_manager.all.count

    task_manager.destroy(current_task_id)
    assert_equal 0, task_manager.all.count
  end

  def test_it_updates_a_task
    task_manager.create({
      :title => "Some title",
      :description => "Some description"
      })

    params = { task: { title: "New title", description: "New description"}}

    task_manager.update(current_task_id, params[:task])

    task = task_manager.find(current_task_id)

    assert_equal "New title", task.title
    assert_equal "New description", task.description
  end

end

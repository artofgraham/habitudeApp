require "test_helper"

class NotToDosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @not_to_do = not_to_dos(:one)
  end

  test "should get index" do
    get not_to_dos_url
    assert_response :success
  end

  test "should get new" do
    get new_not_to_do_url
    assert_response :success
  end

  test "should create not_to_do" do
    assert_difference("NotToDo.count") do
      post not_to_dos_url, params: { not_to_do: { done: @not_to_do.done, listdate: @not_to_do.listdate, name: @not_to_do.name, position: @not_to_do.position, priority: @not_to_do.priority, user_id: @not_to_do.user_id } }
    end

    assert_redirected_to not_to_do_url(NotToDo.last)
  end

  test "should show not_to_do" do
    get not_to_do_url(@not_to_do)
    assert_response :success
  end

  test "should get edit" do
    get edit_not_to_do_url(@not_to_do)
    assert_response :success
  end

  test "should update not_to_do" do
    patch not_to_do_url(@not_to_do), params: { not_to_do: { done: @not_to_do.done, listdate: @not_to_do.listdate, name: @not_to_do.name, position: @not_to_do.position, priority: @not_to_do.priority, user_id: @not_to_do.user_id } }
    assert_redirected_to not_to_do_url(@not_to_do)
  end

  test "should destroy not_to_do" do
    assert_difference("NotToDo.count", -1) do
      delete not_to_do_url(@not_to_do)
    end

    assert_redirected_to not_to_dos_url
  end
end

require "application_system_test_case"

class NotToDosTest < ApplicationSystemTestCase
  setup do
    @not_to_do = not_to_dos(:one)
  end

  test "visiting the index" do
    visit not_to_dos_url
    assert_selector "h1", text: "Not to dos"
  end

  test "should create not to do" do
    visit not_to_dos_url
    click_on "New not to do"

    check "Done" if @not_to_do.done
    fill_in "Listdate", with: @not_to_do.listdate
    fill_in "Name", with: @not_to_do.name
    fill_in "Position", with: @not_to_do.position
    fill_in "Priority", with: @not_to_do.priority
    fill_in "User", with: @not_to_do.user_id
    click_on "Create Not to do"

    assert_text "Not to do was successfully created"
    click_on "Back"
  end

  test "should update Not to do" do
    visit not_to_do_url(@not_to_do)
    click_on "Edit this not to do", match: :first

    check "Done" if @not_to_do.done
    fill_in "Listdate", with: @not_to_do.listdate
    fill_in "Name", with: @not_to_do.name
    fill_in "Position", with: @not_to_do.position
    fill_in "Priority", with: @not_to_do.priority
    fill_in "User", with: @not_to_do.user_id
    click_on "Update Not to do"

    assert_text "Not to do was successfully updated"
    click_on "Back"
  end

  test "should destroy Not to do" do
    visit not_to_do_url(@not_to_do)
    click_on "Destroy this not to do", match: :first

    assert_text "Not to do was successfully destroyed"
  end
end

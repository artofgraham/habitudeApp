require "application_system_test_case"

class TrackersTest < ApplicationSystemTestCase
  setup do
    @tracker = trackers(:one)
  end

  test "visiting the index" do
    visit trackers_url
    assert_selector "h1", text: "Trackers"
  end

  test "should create tracker" do
    visit trackers_url
    click_on "New tracker"

    fill_in "Days", with: @tracker.days
    fill_in "Habitdate", with: @tracker.habitdate
    fill_in "Score", with: @tracker.score
    fill_in "Title", with: @tracker.title
    fill_in "Total", with: @tracker.total
    fill_in "User", with: @tracker.user_id
    click_on "Create Tracker"

    assert_text "Tracker was successfully created"
    click_on "Back"
  end

  test "should update Tracker" do
    visit tracker_url(@tracker)
    click_on "Edit this tracker", match: :first

    fill_in "Days", with: @tracker.days
    fill_in "Habitdate", with: @tracker.habitdate
    fill_in "Score", with: @tracker.score
    fill_in "Title", with: @tracker.title
    fill_in "Total", with: @tracker.total
    fill_in "User", with: @tracker.user_id
    click_on "Update Tracker"

    assert_text "Tracker was successfully updated"
    click_on "Back"
  end

  test "should destroy Tracker" do
    visit tracker_url(@tracker)
    click_on "Destroy this tracker", match: :first

    assert_text "Tracker was successfully destroyed"
  end
end

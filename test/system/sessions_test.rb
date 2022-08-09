require "application_system_test_case"

class WorkoutsTest < ApplicationSystemTestCase
  setup do
    @workout = workouts(:one)
  end

  test "visiting the index" do
    visit workouts_url
    assert_selector "h1", text: "workouts"
  end

  test "should create workout" do
    visit workouts_url
    click_on "New Workout"

    fill_in "Description", with: @workout.description
    fill_in "Name", with: @workout.name
    click_on "Create Workout"

    assert_text "workout was successfully created"
    click_on "Back"
  end

  test "should update workout" do
    visit workout_url(@workout)
    click_on "Edit this workout", match: :first

    fill_in "Description", with: @workout.description
    fill_in "Name", with: @workout.name
    click_on "Update Workout"

    assert_text "workout was successfully updated"
    click_on "Back"
  end

  test "should destroy workout" do
    visit workout_url(@workout)
    click_on "Destroy this workout", match: :first

    assert_text "workout was successfully destroyed"
  end
end

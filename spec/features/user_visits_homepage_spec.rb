require "rails_helper"

feature "User visits homepage" do
  scenario "successfully" do
    user = create(:user, admin: true)
    workout_1 = create(:workout, id: 7, name: "Some workout", description: "This is a test workout", user: user)
    workout_2 = create(:workout, id: 5, name: "Some workout", description: "This is a test workout", user: user)
    workout_3 = create(:workout, id: 4, name: "Some workout", description: "This is a test workout", user: user)

    visit root_path
    expect(page).to have_css 'h1', text: 'Workout'
  end
end
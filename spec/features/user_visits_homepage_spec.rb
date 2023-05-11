require "rails_helper"

feature "User visits homepage" do
  scenario "successfully" do
    user = create(:user, admin: true)
    article = create(:article, title: "Published article", summary: "This is the summary of a published test article", published: true, user: user)

    visit root_path
    expect(page).to have_css 'h1', text: 'Tool'
  end
end
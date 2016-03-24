require 'rails_helper'

feature "sees question details" do
  scenario "submit a new question" do
    visit questions_path
    click_on "New Question"

    title1 = "#{Faker::Lorem.characters(60)}"
    body1 = "#{Faker::Lorem.characters(160)}"


    fill_in "Title", with: "#{title1}"
    fill_in "Details", with: "#{body1}"

    click_button "Submit your question"

    expect(page).to have_content(title1)


  end
end

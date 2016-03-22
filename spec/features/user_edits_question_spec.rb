require 'rails_helper'

feature "sees questions and able to edit" do
  scenario "sees a question and edits it" do
    question1 = Question.create(title: Faker::Lorem.characters(70), body: Faker::Lorem.characters(160))
    edit = Faker::Lorem.characters(155)

    visit question_path(question1)

    expect(page).to have_content(question1.body)
    click_button "Edit"

    fill_in "Details", with: "#{edit}"
    click_button "Submit your question"
    expect(page).to have_content("#{edit}")
  end
end

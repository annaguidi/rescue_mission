require 'rails_helper'

feature "sees questions" do
  scenario "sees list of questions ordered by most recent post" do
    question1 = Question.create(title: Faker::Lorem.characters(70), body: Faker::Lorem.characters(160))
    answer = Faker::Lorem.characters(60)

    visit question_path(question1)

    expect(page).to have_content(question1.body)

    fill_in "Answer", with: "This is the answer: #{answer}"
    click_button "Submit Answer"
    expect(page).to have_content("#{answer}")
  end
end

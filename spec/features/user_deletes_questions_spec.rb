require 'rails_helper'

feature "sees questions" do
  scenario "is able to delete a question" do
    question1 = Question.create(title: Faker::Lorem.characters(70), body: Faker::Lorem.characters(160))
    answer = Faker::Lorem.characters(60)

    visit question_path(question1)

    click_button "Delete"


    expect(page).to_not have_content(question1.body)
  end

  scenario "able to delete from edit page" do
    question1 = Question.create(title: Faker::Lorem.characters(70), body: Faker::Lorem.characters(160))
    answer = Faker::Lorem.characters(60)

    visit edit_question_path(question1)

    click_button "Delete"

    expect(page).to_not have_content(question1.body)


  end
end

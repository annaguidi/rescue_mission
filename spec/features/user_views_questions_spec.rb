require 'rails_helper'

feature "sees questions" do
  scenario "sees list of questions ordered by most recent post" do
    question1 = Question.create(title: "help", body: "i'm so confused")
    question2 = Question.create(title: "css problems", body: "styling issues please help")

    visit questions_path
    expect(page) =~ /#{question2}.*#{question1}/
    expect(page).to have_content(question1.title)
    expect(page).to have_content(question2.title)

  end
end

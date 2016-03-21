require 'rails_helper'

feature "sees question details" do
  scenario "sees details of questions ordered by most recent post" do
    question1 = Question.create(title: "help", body: "i'm so confused")
    question2 = Question.create(title: "css problems", body: "styling issues please help")
    
    visit questions_path
    click_on "#{question1.title}"

    expect(page).to have_content(question1.title)
    expect(page).to have_content(question1.body)


  end
end

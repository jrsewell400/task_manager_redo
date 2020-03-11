require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I want to edit a task" do 
    it "then I can visit an individual tasks Show Page and edit the task." do
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")

      visit "/tasks/#{task_1.id}"

      click_on "Edit Task"

      fill_in :title, with: "Task 3"
      fill_in :description, with: "This is Task 3"
      click_on "Submit"

      expect(page).to_not have_content("Task 1")
      expect(page).to_not have_content("This is Task 1")
      expect(page).to have_content("Task 3")
      expect(page).to have_content("This is Task 3")
    end 
  end
end
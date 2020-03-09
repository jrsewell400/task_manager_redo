require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I go to the Tasks Index Page" do
    it "then I click on the option to delete a task and see the task get deleted." do
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      task_2 = Task.create(title: "Task 2", description: "This is Task 2")

      visit tasks_path 
    
      within "#task-#{task_1.id}" do 
        click_on "Delete Task"
      end
      
      expect(page).to_not have_content(task_1.title)
      expect(page).to have_content(task_2.title)
    end 
  end
end
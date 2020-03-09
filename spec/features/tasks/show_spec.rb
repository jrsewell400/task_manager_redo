require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit a task's show page" do 
    it "then I see a link that can be clicked and takes me back to Task Index page." do
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      
      visit "/tasks/#{task_1.id}"

      click_on "Task Index"

      expect(current_path).to eq("/tasks")
    end 

    it "then I see the name and description of the task." do
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      
      visit "/tasks/#{task_1.id}"

      expect(page).to have_content(task_1.title)
      expect(page).to have_content(task_1.description)
    end

    it "then I see a link to edit the task and it takes me to the form where the task can be edited." do 
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      
      visit "/tasks/#{task_1.id}"

      click_on "Edit Task"

      expect(current_path).to eq("/tasks/#{task_1.id}/edit")
    end
  end
end
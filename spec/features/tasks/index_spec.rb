require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I visit the Tasks Index Page" do 
    it "then I can see and use a link to take me back to Tasks Welcome index page." do
      visit tasks_path

      click_on "Tasks Welcome"

      expect(current_path).to eq("/")
    end 

    it "then I can see each task title and description within its own section." do
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      task_2 = Task.create(title: "Task 2", description: "This is Task 2")
      task_3 = Task.create(title: "Task 3", description: "This is Task 3")

      visit tasks_path 

      within "#task-#{task_1.id}" do 
        expect(page).to have_content(task_1.title)
        expect(page).to have_content(task_1.description)
      end

      within "#task-#{task_2.id}" do 
        expect(page).to have_content(task_2.title)
        expect(page).to have_content(task_2.description)
      end

      within "#task-#{task_3.id}" do 
        expect(page).to have_content(task_3.title)
        expect(page).to have_content(task_3.description)
      end
    end

    it "then I can see a each task has a link to it's show page and a link to delete the task." do 
      task_1 = Task.create(title: "Task 1", description: "This is Task 1")
      task_2 = Task.create(title: "Task 2", description: "This is Task 2")

      visit tasks_path 

      within "#task-#{task_1.id}" do 
        expect(page).to have_link(task_1.title)
        expect(page).to have_link("Delete Task")
        click_on task_1.title
        expect(current_path).to eq("/tasks/#{task_1.id}")
      end

      visit tasks_path

      within "#task-#{task_2.id}" do 
        expect(page).to have_link(task_2.title)
        expect(page).to have_link("Delete Task")
        click_on task_2.title
        expect(current_path).to eq("/tasks/#{task_2.id}")
      end
    end 
  end
end
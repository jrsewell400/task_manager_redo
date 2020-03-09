require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I want to make a new task" do 
    it "then I can." do
      visit "/"

      click_on "New Task"
      
      fill_in :title, with: "Task 6"
      fill_in :description, with: "This is Task 6"
      click_on "Submit"

      expect(page).to have_content("Task 6")
    end 
  end
end
require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I i visit the welcome index page," do 
    it "then I see links for Task Index and New Task and that they go to the right routes." do
      visit "/"

      click_on "Task Index"

      expect(current_path).to eq(tasks_path)

      visit "/"

      click_on "New Task"

      expect(current_path).to eq(tasks_new_path)
    end 
  end
end
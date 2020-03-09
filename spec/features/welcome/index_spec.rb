require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do 
  describe "when I i visit the welcome index page," do 
    it "then I see links for Task Index and New Task." do
      visit "/"

      expect(page).to have_link("Task Index")
      expect(page).to have_link("New Task")
    end 
  end
end
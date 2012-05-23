require 'spec_helper'

describe "Pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/pages/home'
      page.should have_content('Sample App')
    end
    it "should have the right title" do
      visit '/pages/home'
      page.should have_selector('title', :text => "| Home")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/pages/about'
      page.should have_content('About')
      page.should have_selector('title', :text => "| About")
    end
    it "should have the right title" do
      visit '/pages/about'
      page.should have_selector('title', :text => "| About")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/pages/help'
      page.should have_content('Help')
      page.should have_selector('title', :text => "| Help")
    end
    it "should have the right title" do
      visit '/pages/help'
      page.should have_selector('title', :text => "| Help")
    end
  end
end
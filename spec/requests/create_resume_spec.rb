require 'spec_helper'

describe "Create a new resume record" do

  def fill_minimal_form
    fill_in "First name", :with => Faker::Name.first_name
    fill_in "Last name", :with => Faker::Name.last_name
  end

  before :each do
    visit new_resume_path
    fill_minimal_form
  end

  context "when I have not entered minimal data" do
    it "should tell me the first name is required" do
      fill_in "First name", :with => ""
      click_on "Create"
      page.should have_content("can't be blank")
    end

    it "should tell me the last name is required" do
      fill_in "Last name", :with => ""
      click_on "Create"
      page.should have_content("can't be blank")
    end
  end



  it "should increase the number of visible resume" do
    expect{click_on "Create"}.to change(Resume, :count).by(1)
    page.all(:xpath, "//table/tr").should have(1+1).nodes
  end

  it "should allow me to wrrite a first name" do
    fill_in 'First name', :with => "John"
    click_on "Create"
    Resume.last.first_name.should == "John"
  end

  it "should allow me to wrrite a last name" do
    fill_in 'Last name', :with => "Doe"
    click_on "Create"
    Resume.last.last_name.should == "Doe"
  end

  it "should allow me to wrrite an introduction" do
    fill_in 'Intro', :with => "Sample Introduction from automatic test"
    click_on "Create"
    Resume.last.intro.should == "Sample Introduction from automatic test"
  end

  it "should allow me to easily add projects", :js => true do
    click_on "Add Project"
    within_fieldset "Project Details" do
      fill_in "Title",  :with => "Some great Project"
      fill_in "Description",  :with => "This was a very cool project and it helped us learn a lot"
      fill_in "Duration",  :with => "a few days"
      fill_in "Technology list",  :with => "Ruby, Rails, Rspec"
    end
    click_on "Create"
    page.should have_content("Listing resumes") # we must wait since we are is a js => true spec
    Resume.last.projects.should have(1).project
    project =  Resume.last.projects.first
    project.title.should == "Some great Project"
    project.description.should == "This was a very cool project and it helped us learn a lot"
    project.duration.should == "a few days"
    project.technology_list.should match_array(%w(Rspec Rails Ruby))

  end

  it "should allow me to easily add experience", :js => true do
    click_on "Add Experience"
    within_fieldset "Experience Details" do
      fill_in "Title",  :with => "Ruby on Rails Developer"
      fill_in "Company",  :with => "Acme"
      fill_in "Place",  :with => "Paris"
      select_month '01/2012', :from => 'From date'
      select_month '02/2012', :from => 'Until date'
      fill_in "Description",  :with => "Coaching two students and working on a reporting app"
      fill_in "Technology list",  :with => "Ruby, Rails, Rspec"
    end
    click_on "Create"
    page.should have_content("Listing resumes") # we must wait since we are is a js => true spec
    Resume.last.experiences.should have(1).experience
    experience =  Resume.last.experiences.first
    experience.title.should == "Ruby on Rails Developer"
    experience.company.should == "Acme"
    experience.place.should == "Paris"
    experience.from_date.should == Date.parse('01/01/2012')
    experience.until_date.should == Date.parse('01/02/2012')
    experience.description.should == "Coaching two students and working on a reporting app"
    experience.technology_list.should match_array(%w(Rspec Rails Ruby))

  end




end
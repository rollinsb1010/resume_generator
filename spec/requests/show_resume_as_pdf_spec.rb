require 'spec_helper'

describe "Show Resume as a PDF File" do

  let(:resume){FactoryGirl.build(:resume_filled_with_data)}

  before :each do
    resume.save!
  end

  it "should send me a openable pdf file" do
    get "resumes/#{resume.id}.pdf"
    response.content_type.to_s.should == "application/pdf"
  end

  it "should send me a real pdf file" do
    get "resumes/#{resume.id}.pdf"
    response.body.should =~ /^%PDF/
  end

end
require 'spec_helper'

describe Experience do
  subject {FactoryGirl.build(:experience)}

  describe "validity" do

    it "should not be valid without a title" do
      subject.title = nil
      subject.should_not be_valid
    end

    it "should not be valid without a company" do
      subject.company = nil
      subject.should_not be_valid
    end

    it "should not be valid without a place" do
      subject.place = nil
      subject.should_not be_valid
    end

    it "should not be valid without a starting date" do
      subject.from_date = nil
      subject.should_not be_valid
    end

    it "should not be valid with a starting date in the future" do
      subject.from_date = Date.today + 1.day
      subject.should_not be_valid
    end

    it "should not be valid with a starting date after the ending date" do
      subject.from_date = Date.today
      subject.until_date = 1.day.ago
      subject.should_not be_valid
    end

    it "should be valid without an ending date" do
      subject.until_date = nil
      subject.should be_valid
    end

    it "should be valid without a description" do
      subject.description = nil
      subject.should be_valid
    end

  end
end

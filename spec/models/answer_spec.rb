require 'spec_helper'

describe Answer do
  before :each do
    @answer = Answer.new
  end

  it "should be truthy for numeric? if integer" do
    @answer.result_answer = '1'
    @answer.should be_numeric
  end

  it "should be truthy for numeric? if double" do
    @answer.result_answer = '1.0'
    @answer.should be_numeric
  end

  it "should not be truthy for numeric? if letter" do
    @answer.result_answer = 'a'
    @answer.should_not be_numeric
  end
  
  it "should be truthy for categorical? if letter" do
    @answer.result_answer = 'a'
    @answer.should be_categorical
  end
  
  it "should not be truthy for categorical? if integer" do
    @answer.result_answer = '1'
    @answer.should_not be_categorical
  end
end

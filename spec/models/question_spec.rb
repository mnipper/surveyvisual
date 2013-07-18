require 'spec_helper'

describe Question do
  before :all do
    @question = Question.new
    @question.screen_id = '1'
    @answers = []
    @answers << Answer.create!(screen_id: @question.screen_id) 
    @answers << Answer.create!(screen_id: @question.screen_id) 
  end

  it "should return the correct answer based on screen_id" do
    @question.answers.should == @answers
  end

  after :all do
    Answer.destroy_all
  end
end

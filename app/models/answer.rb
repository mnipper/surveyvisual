class Answer
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :result_answer, type: String 
  field :response_date, type: String 
  field :result_id, type: Integer

  def question
    Question.find_by(screen_id: self.screen_id)
  end

  def participant
    result.participant
  end

  def result
    Result.find_by(result_id: self.result_id)
  end

  def numeric?
    self.result_answer =~ /^\d*[\.]{0,1}\d*$/
  end

  def categorical?
    !self.numeric?
  end

  def stats
    StatFactory.stats(question)
  end
end

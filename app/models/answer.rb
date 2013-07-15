class Answer
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :result_answer, type: String 
  field :response_date, type: DateTime 
  field :result_id, type: Integer

  def question
    Question.find_by(screen_id: answer.screen_id)
  end

  def participant
    result.participant
  end

  def result
    Result.find_by(result_id: self.result_id)
  end
end

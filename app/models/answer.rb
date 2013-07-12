class Answer
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :result_answer, type: String 
  field :response_date, type: DateTime 
  field :result_id, type: Integer

  def question
    Question.find_by(screen_id: self.screen_id)
  end

  def result
    Result.find_by(result_id: self.result_id)
  end

  def participant
    Participant.find_by(_id: result.participant_id)
  end
end

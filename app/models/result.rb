class Result
  include Mongoid::Document
  field :result_id, type: Integer 
  field :participant_id, type: Integer

  def answers
    Answer.where(result_id: self.result_id).entries
  end

  def participant
    Participant.find_by(_id: self.participant_id)
  end

  def complete_responses
    answers.count
  end

  def percent_complete_responses
    answers.count / Question.count.to_f
  end
end

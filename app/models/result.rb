class Result
  include Mongoid::Document
  field :result_id, type: Integer 
  field :participant_id, type: Integer

  def answers
    Answer.where(result_id: self.result_id).entries
  end

  def participant
    Participant.find_by(participant_id: self.participant_id)
  end
end

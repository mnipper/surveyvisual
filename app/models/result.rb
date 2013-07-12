class Result
  include Mongoid::Document
  field :result_id, type: Integer 
  field :participant_id, type: Integer

  def answers
    answers_arr = []
    Answer.find_by(result_id: self.result_id) do |answer|
      answers_arr << answer
    end
    answers_arr
  end

  def participant
    Participant.find_by(participant_id: self.participant_id)
  end
end

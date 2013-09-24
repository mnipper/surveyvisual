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

  def percent_complete
    answers.count / Question.count.to_f
  end

  def last_result_time
    answers.first.response_date
  end

  def first_result_time
    answers.last.response_date
  end

  def self.result_time_screen_id
    '431427'
  end

  def result_time
    Answer.where(result_id: self.result_id)
      .find_by(screen_id: Result.result_time_screen_id)
      .result_answer
  end
end

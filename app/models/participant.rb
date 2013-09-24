class Participant
  include Mongoid::Document
  field :_id, type: Integer 

  def results
    Result.where(participant_id: self._id).entries
  end

  def self.participant_screen_id
    '431426'
  end

  def response_rate
    first_response_date = results.first.answers.last.response_date
    should_have = (DateTime.now - first_response_date.to_datetime).to_i * 3
    (results.count.to_f / should_have).round(3)
  end
end

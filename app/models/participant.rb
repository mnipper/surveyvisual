class Participant
  include Mongoid::Document
  field :_id, type: Integer 

  def results
    Result.where(participant_id: self._id).entries
  end

  def self.participant_screen_id
    '431426'
  end
end

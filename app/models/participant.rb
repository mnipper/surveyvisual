class Participant
  include Mongoid::Document
  field :_id, type: Integer 

  def results
    results_arr = []
    Result.find_by(participant_id: _id) do |result|
      results_arr << result
    end
    results_arr
  end

  def self.participant_screen_id
    '431426'
  end
end

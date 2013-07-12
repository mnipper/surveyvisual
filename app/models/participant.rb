class Participant
  def self.results(participant)
    results = []
    Isurvey::Result.all.each do |result|
      Isurvey::Answer.by_result_id(result.result_id).each do |answer|
        if answer.screen_id == participant_screen_id and answer.result_answer == participant
          results << result
        end
      end
    end
    results
  end

  def self.all
    Isurvey::Answer.find_by_screen_id(participant_screen_id).map do |participant|
      participant.result_answer
    end.uniq
  end

  private
  def self.participant_screen_id
    '431426'
  end
end

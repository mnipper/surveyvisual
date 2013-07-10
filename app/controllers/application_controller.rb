class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  Isurvey::API.load

  def results_by_participant(participant)
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

  def participants
    Isurvey::Answer.find_by_screen_id(participant_screen_id).map do |participant|
      participant.result_answer
    end.uniq
  end

  private
  def participant_screen_id
    '431426'
  end
end

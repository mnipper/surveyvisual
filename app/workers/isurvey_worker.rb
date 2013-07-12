class IsurveyWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform
    load_api_data
  end

  private
  def load_api_data
    Isurvey::API.load

    Isurvey::Result.all.each do |result|
      Result.find_or_create_by(result_id: result.result_id) 
    end

    Isurvey::Question.all.each do |question|
      Question.find_or_create_by(screen_id:     question.screen_id,
                                 screen_text:   question.screen_text) 
    end

    Isurvey::Answer.all.each do |answer|
      Answer.find_or_create_by(screen_id:       answer.screen_id,
                               result_answer:   answer.result_answer,
                               response_date:   answer.response_date,
                               result_id:       answer.result_id)
    end

    Answer.where(screen_id: Participant.participant_screen_id).each do |answer|
      new_participant = Participant.find_or_create_by(_id: answer.result_answer)
      Result.where(result_id: answer.result_id).update(participant_id: new_participant._id)
    end
  end
end

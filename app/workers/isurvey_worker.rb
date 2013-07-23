class IsurveyWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    load_api_data
    create_results
    create_questions
    create_answers
    create_participants
  end

  private
  def load_api_data
    Isurvey::API.load
  end

  def create_results
    Isurvey::Result.all.each do |result|
      Result.find_or_create_by(result_id: result.result_id) 
    end
  end

  def create_questions
    Isurvey::Question.all.each do |question|
      Question.find_or_create_by(screen_id:     question.screen_id,
                                 screen_text:   question.screen_text) 
    end
  end

  def create_answers
    Isurvey::Answer.all.each do |answer|
      Answer.find_or_create_by(screen_id:       answer.screen_id,
                               result_answer:   answer.result_answer,
                               result_id:       answer.result_id,
                               response_date:   answer.response_date)
    end
  end

  def create_participants
    Answer.where(screen_id: Participant.participant_screen_id).each do |answer|
      participant = Participant.find_or_create_by(_id: answer.result_answer)
      result = Result.find_by(result_id: answer.result_id)
      result.update_attributes!(participant_id: participant._id)
    end

    Answer.each do |answer|
      answer.update_attributes!(participant_id: answer.participant._id)
    end
  end
end

class IsurveyWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform
    load_api_data
    create_associations
  end

  private
  def load_api_data
    Isurvey::API.load
    Isurvey::Result.all.each do |result|
      current_result = Result.new result_id: result.result_id 
      current_result.upsert
    end

    Isurvey::Question.all.each do |question|
      current_question = Question.new screen_id: question.screen_id, screen_text: question.screen_text 
      current_question.upsert
    end

    Isurvey::Answer.all.each do |answer|
      current_answer = Answer.new screen_id: answer.screen_id, result_answer: answer.result_answer, response_date: answer.response_date
      current_answer.result = Result.where(result_id: answer.result_id)
      current_answer.upsert
    end
  end

  def create_associations
    Question.each do |question|
      question.answers = Answer.where(screen_id: question.screen_id)
    end

    Answer.each do |answer|
      answer.question = Question.where(screen_id: answer.screen_id)
    end

    Answer.where(screen_id: Participant.participant_screen_id).each do |answer|
      current_participant = Participant.new _id: answer.result_answer
      current_participant.upsert
    end
  end
end

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
      current_answer.upsert
    end
  end

  def create_associations
  end
end

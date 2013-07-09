class QuestionsController < ApplicationController
  def index
    @questions = Isurvey::Question.all

    respond_to do |format|
      format.html
      format.json { render json: @questions.to_json }
    end
  end
end

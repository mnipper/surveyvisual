class AnswersController < ApplicationController
  def index
    @answers = Isurvey::Answer.all

    respond_to do |format|
      format.html
      format.json { render json: @answers.to_json }
    end
  end
end

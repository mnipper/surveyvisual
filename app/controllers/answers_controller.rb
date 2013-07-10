class AnswersController < ApplicationController
  def index
    @answers = Isurvey::Answer.by_result_id(params[:result_id])

    respond_to do |format|
      format.html
      format.json { render json: @answers.to_json }
    end
  end
end

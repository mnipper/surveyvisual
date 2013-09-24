class AnswersController < ApplicationController
  def index
    @answers = Result.find_by(result_id: params[:result_id]).answers
    @participant = Participant.find(params[:participant_id])
    @results = @participant.results 

    respond_to do |format|
      format.html
      format.json { render json: @answers.to_json }
    end
  end
end

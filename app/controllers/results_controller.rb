class ResultsController < ApplicationController
  def index
    @participant = params[:participant_id] 
    @results = results_by_participant(@participant) 

    respond_to do |format|
      format.html
      format.json { render json: @results.to_json }
    end
  end
end

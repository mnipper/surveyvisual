class ResultsController < ApplicationController
  def index
    @participant = Participant.find_by(_id: params[:participant_id]) 
    @results = @participant.results 

    require 'debugger'; debugger

    respond_to do |format|
      format.html
      format.json { render json: @results.to_json }
    end
  end
end

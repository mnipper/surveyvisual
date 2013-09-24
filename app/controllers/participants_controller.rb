class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @participant = Participant.find(params[:id])
    @results = @participant.results 
  end

  def refresh
    IsurveyWorker.perform_async 
    flash[:success] = 'Data has been refreshed!'
    redirect_to request.referrer
  end
end

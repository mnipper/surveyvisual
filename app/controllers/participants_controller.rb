class ParticipantsController < ApplicationController
  def index
    @participants = participants
  end
end

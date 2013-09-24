class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.json { render json: @questions.to_json }
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end

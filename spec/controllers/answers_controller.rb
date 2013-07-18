require "spec_helper"

describe AnswersController do
  before :each do
    @participant = Participant.create!(_id: '1')
    @result = Participant.create!(result_id: '1', participant_id: @participant._id)
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, participant_id: @participant._id, result_id: @result.result_id 
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index" do
      get :index, participant_id: @participant._id, result_id: @result.result_id 
      expect(response).to render_template("index")
    end
  end

  after :each do
    Participant.destroy_all
    Result.destroy_all
  end
end

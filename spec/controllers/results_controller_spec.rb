require "spec_helper"

describe ResultsController do
  before :each do
    @participant = Participant.create!(_id: '9999')
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, participant_id: @participant._id 
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index, participant_id: @participant._id 
      expect(response).to render_template("index")
    end
  end

  after :each do
    Participant.destroy_all
  end
end

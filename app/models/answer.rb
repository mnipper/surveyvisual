class Answer
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :result_answer, type: String 
  field :response_date, type: DateTime 

  belongs_to :participant
  belongs_to :result

  def question
    Question.where(screen_id: self.screen_id)
  end
end

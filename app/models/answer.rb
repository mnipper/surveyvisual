class Answer
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :result_answer, type: String 
  field :response_date, type: DateTime 

  has_one :question

end

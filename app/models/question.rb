class Question
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :screen_text, type: String 

  has_many :answers
end

class Question
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :screen_text, type: String 

  def answers
    Answer.where(screen_id: self.screen_id)
  end
end

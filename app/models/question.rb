class Question
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :screen_text, type: String 

  def answers
    answers_arr = []
    Answer.find_by(screen_id: self.screen_id) do |answer|
      answers_arr << answer
    end
    answers_arr
  end
end
